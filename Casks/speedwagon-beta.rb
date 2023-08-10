cask "speedwagon-beta" do
  version "0.3.0b4"
  sha256 arm: "dcf3535fa7663aea8693539c4cd82a2739ef8130c0dd34529c11e17ba7098ed6",
         intel: "97f630292f028fb86241c2687828d6c37df2746953db9a4ae842f7654e922e21"
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
