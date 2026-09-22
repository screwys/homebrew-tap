cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.16.0"
  sha256 arm:   "9ee1892a87df1299ae2583ea82df67a0ead0a3b6b12ba4fd06b3224fa8d7aea2",
         intel: "5774c132fc1a6c5cbe7bcbbb84a20b3c955e0da3680225e45695c4b559d010c8"

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
