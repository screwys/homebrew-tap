cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.15.2"
  sha256 arm:   "b3ed60aebaa75500ecccab51334cbbefe9d9070f44de761505f70f5825a17153",
         intel: "44a68c00498d1120f30010ca890aa6db806e86e0c5cc22fe5c1f2504d4537821"

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
