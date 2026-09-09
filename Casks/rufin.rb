cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.15.1"
  sha256 arm:   "185300a757236d76696c0fcfc83eb99491e416384e9e5c67193e90466f3cc5b7",
         intel: "f71eb323e976f474c7fcfe5f11e0dcd5710c1fffc3df9fcdc9c617a5422a34cb"

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
