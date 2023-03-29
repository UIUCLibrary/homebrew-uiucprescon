cask "speedwagon" do
  version "0.2.1"
  sha256 arm: "2de26751f7c50dc4b4577696f636cc04a376976cab79159a03442f0f54c949bc",
         intel: "3ecaef4fa9ac47317ab4113d698e8ee3136928e426728fef7abecd463a4e7428"
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
