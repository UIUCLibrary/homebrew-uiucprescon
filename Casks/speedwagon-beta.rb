cask "speedwagon-beta" do
  version "0.3.0b9"
  sha256 arm: "b37d32f30d220e972d62980951f1ce7d8d11e61eafd1a832dedf2aff6cc67448",
         intel: "ffe85a91d982a0d3d022e0865bfb0ce2a63066c365d75820776a8d43735b764b"
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
