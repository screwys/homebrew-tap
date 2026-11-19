cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.18.0"
  sha256 arm:   "f3ea6118bce71c5735cee92a57159a2ff89a1f05b506c2e0c3ea1b81cf47acf7",
         intel: "0983aa7070017ece259341cb86ebd93c1aef964457976446ed9ce56e4e2ac3e6"

  url "https://github.com/rufin-app/rufin/releases/download/v#{version}/Rufin-macos-#{arch}.dmg"
  name "Rufin"
  desc "GTK music client for Jellyfin, Subsonic, Navidrome, and local libraries"
  homepage "https://github.com/rufin-app/rufin"

  depends_on macos: :sequoia

  app "Rufin.app"

  zap trash: [
    "~/Library/Application Support/app.rufin.rufin",
    "~/Library/Application Support/io.github.screwys.Rufin",
    "~/Library/Caches/app.rufin.rufin",
    "~/Library/Caches/io.github.screwys.Rufin",
    "~/Library/Saved Application State/app.rufin.rufin.savedState",
    "~/Library/Saved Application State/io.github.screwys.Rufin.savedState",
  ]
end
