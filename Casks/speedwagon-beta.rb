cask "speedwagon-beta" do
  version "0.3.0b15"
  sha256 arm: "bd2d1a6751f6f1cbbb399f493d08cb399d1e1f37d01d80f41d56617318bf1a52",
         intel: "703bd7686d2ccf28d238979aaeb47866a76293173e590c3b6bd562a77bfb2ad9"
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
