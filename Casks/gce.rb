cask "gce" do
  version "0.0.4"
  arch arm: "arm64",
       intel: "x86_64"

  sha256 intel: "7baaf9b162ff06dafeb949fe55f8a2c093347ea4694caeae566051924e949ac9",
         arm: "75e605a2abd78c1607bc490cee572f129498a11151d607528d065fcfd1d5bed2"

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
