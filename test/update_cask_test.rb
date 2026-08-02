#!/usr/bin/env ruby

require "fileutils"
require "json"
require "minitest/autorun"
require "open3"
require "rbconfig"
require "tmpdir"

class UpdateCaskTest < Minitest::Test
  ROOT = File.expand_path("..", __dir__)
  FIXTURES = File.join(__dir__, "fixtures")
  SCRIPT = File.join(ROOT, "script", "update-cask")

  def setup
    @tmpdir = Dir.mktmpdir("update-cask-test")
    @release_path = File.join(@tmpdir, "release.json")
    @cask_path = File.join(@tmpdir, "rufin.rb")
    FileUtils.cp(File.join(FIXTURES, "release-v0.12.0.json"), @release_path)
    FileUtils.cp(File.join(FIXTURES, "rufin-v0.11.1.rb"), @cask_path)
  end

  def teardown
    FileUtils.remove_entry(@tmpdir)
  end

  def test_renders_the_exact_release_assets_and_digests
    stdout, stderr, status = run_update

    assert status.success?, stderr
    assert_equal "0.12.0\n", stdout
    assert_empty stderr

    updated = File.read(@cask_path)
    assert_includes updated,
                    "  version \"0.12.0\"\n" \
                    "  sha256 arm:   \"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\",\n" \
                    "         intel: \"bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb\""
    expected_url = 'url "https://github.com/screwys/Rufin/releases/download/' \
                   'v#{version}/Rufin-macos-#{arch}.dmg"'
    assert_includes updated, expected_url
  end

  def test_reports_the_checked_in_cask_tag
    stdout, stderr, status = run_current_tag

    assert status.success?, stderr
    assert_equal "v0.11.1\n", stdout
    assert_empty stderr
  end

  def test_accepts_the_current_release_when_digests_match
    change_release do |release|
      release["tag_name"] = "v0.11.1"
      release.fetch("assets").each do |asset|
        asset["browser_download_url"] = asset.fetch("browser_download_url").sub("v0.12.0", "v0.11.1")
        asset["digest"] = if asset.fetch("name") == "Rufin-macos-arm64.dmg"
                            "sha256:#{'1' * 64}"
                          else
                            "sha256:#{'2' * 64}"
                          end
      end
    end

    original_cask = File.read(@cask_path)
    stdout, stderr, status = run_update

    assert status.success?, stderr
    assert_equal "0.11.1\n", stdout
    assert_empty stderr
    assert_equal original_cask, File.read(@cask_path)
  end

  def test_rejects_a_missing_required_asset
    change_release do |release|
      release.fetch("assets").reject! { |asset| asset.fetch("name") == "Rufin-macos-x86_64.dmg" }
    end

    assert_rejected "Expected one Rufin-macos-x86_64.dmg asset, found 0"
  end

  def test_rejects_a_duplicate_required_asset
    change_release do |release|
      arm_asset = release.fetch("assets").find { |asset| asset.fetch("name") == "Rufin-macos-arm64.dmg" }
      release.fetch("assets") << arm_asset.dup
    end

    assert_rejected "Expected one Rufin-macos-arm64.dmg asset, found 2"
  end

  def test_rejects_an_asset_from_a_different_tag
    change_release do |release|
      release.fetch("assets").first["browser_download_url"] =
        "https://github.com/screwys/Rufin/releases/download/v0.11.1/Rufin-macos-arm64.dmg"
    end

    assert_rejected "Unexpected URL for Rufin-macos-arm64.dmg"
  end

  def test_rejects_a_malformed_digest
    change_release do |release|
      release.fetch("assets").first["digest"] = "sha256:NOT-A-SHA256"
    end

    assert_rejected "Unexpected digest for Rufin-macos-arm64.dmg"
  end

  def test_rejects_a_malformed_tag
    change_release { |release| release["tag_name"] = "0.12.0" }

    assert_rejected "Unexpected Rufin release tag: 0.12.0"
  end

  def test_rejects_a_downgrade
    change_release do |release|
      release["tag_name"] = "v0.10.9"
      release.fetch("assets").each do |asset|
        asset["browser_download_url"] = asset.fetch("browser_download_url").sub("v0.12.0", "v0.10.9")
      end
    end

    assert_rejected "Refusing to downgrade Rufin from 0.11.1 to 0.10.9"
  end

  def test_rejects_changed_digests_for_the_current_release
    change_release do |release|
      release["tag_name"] = "v0.11.1"
      release.fetch("assets").each do |asset|
        asset["browser_download_url"] = asset.fetch("browser_download_url").sub("v0.12.0", "v0.11.1")
      end
    end

    assert_rejected "Refusing to change Rufin 0.11.1 asset digests"
  end

  def test_rejects_a_malformed_current_version
    malformed = File.read(@cask_path).sub('version "0.11.1"', 'version "next"')
    File.write(@cask_path, malformed)

    assert_rejected "Could not find the Rufin release block"
  end

  private

  def change_release
    release = JSON.parse(File.read(@release_path))
    yield release
    File.write(@release_path, JSON.pretty_generate(release))
  end

  def run_update
    Open3.capture3(RbConfig.ruby, SCRIPT, @release_path, @cask_path)
  end

  def run_current_tag
    Open3.capture3(RbConfig.ruby, SCRIPT, "--current-tag", @cask_path)
  end

  def assert_rejected(message)
    original_cask = File.read(@cask_path)
    stdout, stderr, status = run_update

    refute status.success?
    assert_empty stdout
    assert_includes stderr, message
    assert_equal original_cask, File.read(@cask_path)
  end
end
