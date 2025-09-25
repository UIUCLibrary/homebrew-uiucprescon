cask "gce" do
  version "0.0.1"
  arch arm: "arm64",
       intel: "x86_64"

  sha256 intel: "a354a51e9a6398afc30c000de4417e916765c523bd1c90bad128e43029ce42af",
         arm: "1353dc677fbe5a9c5da9bcca3b4e698b0754b96a572618b7798c7764bff8a0b6"

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

  depends_on macos: ">= :sonoma"

  app "Galatea Configuration Editor.app"

end
