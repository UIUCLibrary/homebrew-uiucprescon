cask "speedwagon-prescon" do
  version "0.3.2b6"
  sha256 arm: "4400bfc2917a2168e0172e644cb5f156bbd918153dec1407d29f734ee3a1d446",
         intel: "5aad48aa79433f9f7d91a7fb328a0d4797515325b80a7e8fb2c47b6ff933cf67"
  arch arm: "arm64",
       intel: "x86_64"
  url "https://nexus.library.illinois.edu/repository/prescon-dist/speedwagon_uiuc/#{version}/Speedwagon%20(UIUC%20Prescon%20Edition)-0.3.2.b6-macos-#{arch}.dmg",
      verified: "nexus.library.illinois.edu/repository/prescon-dist/speedwagon_uiuc"
  name "Speedwagon"
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/uiucprescon-workflows"
  app "Speedwagon\ \(UIUC\ Prescon\ Edition\).app"

  livecheck do
    skip "No version information available"
  end
end
