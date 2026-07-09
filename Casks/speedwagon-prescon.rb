cask "speedwagon-prescon" do
  version "0.3.2.b8"
  sha256 arm: "250371b3ce9c3945e10db599ec33aeaab38dd2721f81baa5697bbfc5ee3685ee",
         intel: "16b77c24d0900721c091bb8406f929faa8154fd446bec2a4ed09d7061059f6a9"
  arch arm: "arm64",
       intel: "x86_64"
  url "https://nexus.library.illinois.edu/repository/prescon-dist/speedwagon_uiuc/#{version}/Speedwagon%20(UIUC%20Prescon%20Edition)-#{version}-macos-#{arch}.dmg",
      verified: "nexus.library.illinois.edu/repository/prescon-dist/speedwagon_uiuc"
  name "Speedwagon"
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/uiucprescon-workflows"
  app "Speedwagon\ \(UIUC\ Prescon\ Edition\).app"

  livecheck do
    skip "No version information available"
  end
end
