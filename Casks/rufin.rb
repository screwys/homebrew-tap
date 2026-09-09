cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.15.0"
  sha256 arm:   "88773d8318dd1f0208b8bc422a72bc328ee38b829d1769ec836d06f65f926c2f",
         intel: "568b1b6f9607a6ec7c2fcfbda6c9c8f0e2ca77fae0b16875a7c13b439d50dbf2"

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
