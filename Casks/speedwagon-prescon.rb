cask "speedwagon-prescon" do
  version "0.3.2b3"
  sha256 arm: "d4fff3aec587e3654b623566d33c88af66681982698d5126949f037e1a06f928",
         intel: "6a0e080d45831b0536c8ec604c67c0fe4cec1de49623b32742e40eb3fca47f1c"
  arch arm: "arm64",
       intel: "x86_64"
  url "https://nexus.library.illinois.edu/repository/prescon-dist/speedwagon_uiuc/#{version}/Speedwagon%20(UIUC%20Prescon%20Edition)-0.3.2.b3-macos-#{arch}.dmg",
      verified: "nexus.library.illinois.edu/repository/prescon-dist/speedwagon_uiuc"
  name "Speedwagon"
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/uiucprescon-workflows"
  app "Speedwagon\ \(UIUC\ Prescon\ Edition\).app"

  livecheck do
    skip "No version information available"
  end
end
