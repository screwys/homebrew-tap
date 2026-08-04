cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.12.5"
  sha256 arm:   "dc9247b5ff3399ad2788008a2a76c631df2a130e682e976aaf63ab32df1d29e8",
         intel: "a69917f81b2a442c531ad2044a0d5a8451877a428c5ffe8e3d618f18cbfd6650"

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
