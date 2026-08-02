cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.12.0"
  sha256 arm:   "5e8a0f10b6e0113c720942e9ad0888235359e57f66adc0f41ed537c29b28e879",
         intel: "98dfa89c0818311835afa1f8b8c21fef4d5d2a13c98a1a4ea75ba48e53876f8a"

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
