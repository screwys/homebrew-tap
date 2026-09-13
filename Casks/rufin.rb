cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.15.4"
  sha256 arm:   "030e47edd630c5ad8acb434d0e8f74cc2dc711c3e5a6638db517006954bed047",
         intel: "d303fa63ee98b13f1b4d67c8a5f96cc112a06e068e260a50d1543b6bc8e1e2d9"

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
