cask "speedwagon-beta" do
  version "0.3.0b1"
  sha256 arm: "2ef545924ab2968436e34f43d53a6a075afee4fb2e611678a6b9472ed0a9d05a",
         intel: "f807fb19f43e32fc0fb669d9e7eb6b754d48f4bc8e3a63fe6d940a583cc5c410"
  arch arm: "arm64",
       intel: "x86_64"
  url "https://jenkins.library.illinois.edu/nexus/repository/prescon-dist/speedwagon/#{version}/speedwagon-#{version}-#{arch}.dmg",
      verified: "jenkins.library.illinois.edu/nexus/repository/prescon-dist/speedwagon"
  name "Speedwagon"
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/Speedwagon"
  conflicts_with formula: "speedwagon",
                 cask: "speedwagon"
  app "Speedwagon.app"
end
