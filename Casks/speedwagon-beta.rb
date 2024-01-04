cask "speedwagon-beta" do
  version "0.3.0b10"
  sha256 arm: "e2ec72579d53651bc0c2d832bf0eefaf070ac9744875a27f8b3a0f8fb27b17c5",
         intel: "c64f71ed23e8cb9cec748188ce38b9e2d86ec214ad01f2b1aa735dd210ac0654"
  arch arm: "arm64",
       intel: "x86_64"
  url "https://nexus.library.illinois.edu/repository/prescon-dist/speedwagon/#{version}/speedwagon-#{version}-#{arch}.dmg",
      verified: "nexus.library.illinois.edu/repository/prescon-dist/speedwagon"
  name "Speedwagon"
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/Speedwagon"
  conflicts_with formula: "speedwagon",
                 cask: "speedwagon"
  app "Speedwagon.app"
end
