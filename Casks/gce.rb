cask "gce" do
  version "0.0.2"
  arch arm: "arm64",
       intel: "x86_64"

  sha256 intel: "3e6e1c95c30bf74b165faa3793f5083fe4177f8fb4e0dd54984a1bf6fc0b8281",
         arm: "fdc042a56acd78bd4186d059fe3168c1a9598deb29a7d0231f7980d8990e7175"

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
