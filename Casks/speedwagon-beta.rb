cask "speedwagon-beta" do
  version "0.3.0b5"
  sha256 arm: "0f8f9bb122f29415b9442947c9803448622006d4e5efd5758da452e0e1cf1ae2",
         intel: "22a7a3cf66c51ce90ab0b1ad5052fbfd5feb9e52d75e4d9293f5c854f57ab89e"
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
