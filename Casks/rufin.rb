cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.11.1"
  sha256 arm:   "9e9da73330ffe5ddf937007c27405c34e117c42c3a9ce5ecda856c4214dd1520",
         intel: "f203d9d803841255b9c99dc39da13ffcfa6a1a3e2886e5556dea4fd961cf7456"

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
