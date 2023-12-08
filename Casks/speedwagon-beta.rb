cask "speedwagon-beta" do
  version "0.3.0b8"
  sha256 arm: "efb2575dbbeb96a9d5d97349e9e6586958368b8fe697c8b9330763759b2a2e32",
         intel: "8ac66888fae8463b9d28ba1be723bb7c4e1618a5e9e73ed6ea6bcea2f428087c"
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
