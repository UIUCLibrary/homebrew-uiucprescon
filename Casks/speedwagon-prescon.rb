cask "speedwagon-prescon" do
  version "0.3.2b7"
  sha256 arm: "810fe1382bbc277077ef4cd11ea3d39c87c28cf6f2411850dede653ebe45f7a8",
         intel: "0fc08c9d77f53fb1ebffd881b92f61c7930c6235cb2703eff3b628bea44635ee"
  arch arm: "arm64",
       intel: "x86_64"
  url "https://nexus.library.illinois.edu/repository/prescon-dist/speedwagon_uiuc/#{version}/Speedwagon%20(UIUC%20Prescon%20Edition)-0.3.2.b7-macos-#{arch}.dmg",
      verified: "nexus.library.illinois.edu/repository/prescon-dist/speedwagon_uiuc"
  name "Speedwagon"
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/uiucprescon-workflows"
  app "Speedwagon\ \(UIUC\ Prescon\ Edition\).app"

  livecheck do
    skip "No version information available"
  end
end
