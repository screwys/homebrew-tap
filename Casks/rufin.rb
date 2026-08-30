cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.14.0"
  sha256 arm:   "95acca5abb43800ce08f3f54dc1fc295c3fa9f08ba1f4050ff3982fa84d34408",
         intel: "b2862b002b0cddbfd8b1976d9ed50a7dac037b3bcea531dc7da517d0981526c7"

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
