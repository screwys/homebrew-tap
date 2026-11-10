cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.17.1"
  sha256 arm:   "891568576a449966f8f1599d0fbf97522977f7ef93170adcbb3730cffc2be708",
         intel: "d706fbcf7c9ee3ba3c47f95db5d68f411d9a3b1e94e36859578e2b0213653ae1"

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
