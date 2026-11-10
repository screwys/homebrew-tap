cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.17.0"
  sha256 arm:   "4dba1a1f1402ba389a3163bb347be3ce450da3880bef01ce90e2baa1f9c072d3",
         intel: "a63f9988c5c44c2faa66c1d0c20c4fc3b8476451de8d22b4f5b03c2e45913553"

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
