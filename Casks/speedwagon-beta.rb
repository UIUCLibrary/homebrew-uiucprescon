cask "speedwagon-beta" do
  version "0.3.0b7"
  sha256 arm: "2fa078504a4a559323af9984258c6033ea9e779eb8c27d47dc299565d45d18e9",
         intel: "866b8db2a84c4f751699310ac45dfe39791109587f437df3cf08485663d57281"
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
