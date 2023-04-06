cask "speedwagon" do
  version "0.2.2"
  sha256 arm: "de2e2c26f8f6caa859844ae661fb18c0e5f82cc8b2c781d51dc60704c44cf586",
         intel: "1be47633520c379dcd1594347ac2ae13ca770061edd7a7492f89f3ed52f48316"
  arch arm: "arm64",
       intel: "x86_64"
  url "https://jenkins.library.illinois.edu/nexus/repository/prescon-dist/speedwagon/#{version}/speedwagon-#{version}-#{arch}.dmg",
      verified: "jenkins.library.illinois.edu/nexus/repository/prescon-dist/speedwagon"
  name "Speedwagon"
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/Speedwagon"
  conflicts_with formula: "speedwagon",
                 cask: "speedwagon-beta"
  app "Speedwagon.app"
end
