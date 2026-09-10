cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.15.3"
  sha256 arm:   "7de3af64241c649600692b695ec2a3c347e478c20666530785efb323e9eee38d",
         intel: "66dac27c20a8f1386978fccdf7d02aaa8cd0dcabb20c426fb718af69cc79776d"

  url "https://github.com/screwys/Rufin/releases/download/v#{version}/Rufin-macos-#{arch}.dmg"
  name "Rufin"
  desc "GTK music client for Jellyfin, Subsonic, Navidrome, and local libraries"
  homepage "https://github.com/screwys/Rufin"

  depends_on macos: :sequoia

  app "Rufin.app"

  zap trash: [
    "~/Library/Application Support/io.github.screwys.Rufin",
    "~/Library/Caches/io.github.screwys.Rufin",
    "~/Library/Saved Application State/io.github.screwys.Rufin.savedState",
  ]
end
