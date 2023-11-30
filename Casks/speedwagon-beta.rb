cask "speedwagon-beta" do
  version "0.3.0b6"
  sha256 arm: "3deb1544758f6f71247d937acc829065a1181ee5885238c6ec59abd4ff0ea008",
         intel: "8bdb140efd9166f5a3b00c66b4bdbc3a969ef9229dcac42284791cc05cf5a79e"
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
