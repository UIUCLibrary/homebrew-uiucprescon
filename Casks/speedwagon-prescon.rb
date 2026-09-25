cask "speedwagon-prescon" do
  version "0.3.2.b9"
  sha256 arm: "b6d05d671c1cd8454f0952e905df2c4d332eeb3b7036a47d5927871975c85642",
         intel: "775ab0294eaaf8112d24b93bc5ae63c133305fb922e98d9f7fcb54154490fb24"
  arch arm: "arm64",
       intel: "x86_64"
  url "https://nexus.library.illinois.edu/repository/prescon-dist/speedwagon_uiuc/0.3.2b9/Speedwagon%20(UIUC%20Prescon%20Edition)-#{version}-macos-#{arch}.dmg",
      verified: "nexus.library.illinois.edu/repository/prescon-dist/speedwagon_uiuc"
  name "Speedwagon"
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/uiucprescon-workflows"
  app "Speedwagon\ \(UIUC\ Prescon\ Edition\).app"

  livecheck do
    skip "No version information available"
  end
end
