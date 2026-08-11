cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.13.1"
  sha256 arm:   "dd34325aa0d38dd0f722ba3f40b1a9583e1f8ced46710ccdc04e6321b2553f7b",
         intel: "2ab00c3a53ffa5ce4ec3a02da47122cd054eea8172866e6493345bdd71327509"

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
