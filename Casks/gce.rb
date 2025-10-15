cask "gce" do
  version "0.0.3"
  arch arm: "arm64",
       intel: "x86_64"

  sha256 intel: "2760a60a2c1af2a55bf22ad35f998e5edf6184fdad7ed3d81823d473d1b57448",
         arm: "6d3634ea4ceb70cbad3151d2891a89aa06d99612ec8aaded9f0e76e63f13edac"

  url "https://nexus.library.illinois.edu/repository/prescon-dist/gce/Galatea%20Config%20Editor-#{version}-macos-#{arch}.dmg",
      verified: "nexus.library.illinois.edu/repository/prescon-dist/gce"
  name "Galatea Config Editor"
  desc "Desktop application for editing Galatea configurations."
  homepage "https://github.com/UIUCLibrary/gce"

  livecheck do
    url "https://nexus.library.illinois.edu/service/rest/v1/search/assets?repository=prescon-dist&group=/gce" # URL to check for updates
    regex(/Galatea\sConfig\sEditor[._-]v?(\d+(?:\.\d+)+)[._-]macos[._-]x86_64|arm64\.dmg/i)
    # strategy :page_match
    # skip "No version information available"
  end

  depends_on macos: ">= :big_sur"

  app "Galatea Configuration Editor.app"

end
