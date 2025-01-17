cask "speedwagon" do
  version "0.3.1"
  sha256 arm: "970f7756e45fc55f056ceea86155cbdbe9541541616e90599d5cf59936a8770e",
         intel: "89ebc8574e405ac618b46cb5690669cf024266b3d0e27e083eb3aecc7f02e2c5"
  arch arm: "arm64",
       intel: "x86_64"
  url "https://nexus.library.illinois.edu/repository/prescon-dist/speedwagon/#{version}/speedwagon-#{version}-#{arch}.dmg",
      verified: "nexus.library.illinois.edu/repository/prescon-dist/speedwagon"
  name "Speedwagon"
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/Speedwagon"
  conflicts_with formula: "speedwagon",
                 cask: "speedwagon-beta"
  app "Speedwagon.app"

  livecheck do
    skip "No version information available"
  end
end
