cask "speedwagon-beta" do
  version "0.3.0b11"
  sha256 arm: "bc21bea27a89ebf77b294e7424abfb485773cebbf683666ff76b4881e1531938",
         intel: "c746c6163af54785b29d9c1034e12a569bbf520d1978bf5ffafc63e743bf9cdf"
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
