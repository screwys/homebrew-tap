cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.16.6"
  sha256 arm:   "04ec1aa85033b1e8d5f561b2cdeebf0e53ecf80d11f782b2cb2e93505eec1fb1",
         intel: "5fda2da7b8352270f3c83b376541a20ba2eb3c922479f3fd3ec66b245e62f296"

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
