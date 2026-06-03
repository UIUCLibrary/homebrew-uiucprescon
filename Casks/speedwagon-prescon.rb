cask "speedwagon-prescon" do
  version "0.3.2b5"
  sha256 arm: "636f83d858eae6c0a039d511ced8230688e4ca2b864c1fab08d09674eadde8fa",
         intel: "1a8d9276cf103d88d2b6f63d77e87f9fbc01da03d696e85808cdad41a6d9e2f5"
  arch arm: "arm64",
       intel: "x86_64"
  url "https://nexus.library.illinois.edu/repository/prescon-dist/speedwagon_uiuc/#{version}/Speedwagon%20(UIUC%20Prescon%20Edition)-0.3.2.b5-macos-#{arch}.dmg",
      verified: "nexus.library.illinois.edu/repository/prescon-dist/speedwagon_uiuc"
  name "Speedwagon"
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/uiucprescon-workflows"
  app "Speedwagon\ \(UIUC\ Prescon\ Edition\).app"

  livecheck do
    skip "No version information available"
  end
end
