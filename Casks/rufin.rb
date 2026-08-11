cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.13.0"
  sha256 arm:   "186e2fe926f5632069545d31826216a7312aec49de699064bdff193f74036ce0",
         intel: "e324d4eac46e9ea304f1786f660b6163c32912c95d998142f461067a0df9df39"

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
