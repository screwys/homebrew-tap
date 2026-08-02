cask "rufin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.11.1"
  sha256 arm:   "1111111111111111111111111111111111111111111111111111111111111111",
         intel: "2222222222222222222222222222222222222222222222222222222222222222"

  url "https://github.com/screwys/Rufin/releases/download/v#{version}/Rufin-macos-#{arch}.dmg"
end
