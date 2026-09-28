cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.16.5"
  sha256 arm:   "4148c19e7b5a0a37393f5af39f2daec3e2d08c8853b81270c476ce61f6f2bce4",
         intel: "3525647be6dc5ecc8ecddff12c8635d54a1e228b1445372f1bbc4b870677a7e4"

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
