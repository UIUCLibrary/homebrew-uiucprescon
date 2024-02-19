cask "speedwagon" do
  version "0.3.0"
  sha256 arm: "4d49867ccd365520991ee54e3ecf8beb86d29b7d181a0421ce5d32b8551b19d3",
         intel: "945c40cb073bccead96b8e8d3f954aa69a2a0a6eac24c999067bee41b4da3f18"
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
end
