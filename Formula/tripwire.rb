# typed: true
# frozen_string_literal: true

class Tripwire < Formula
  include Language::Python::Virtualenv

  desc "Used for helping out AV preservation"
  homepage "https://github.com/UIUCLibrary/tripwire"
  url "https://github.com/UIUCLibrary/tripwire/releases/download/v0.3.8/uiucprescon_tripwire-0.3.8.tar.gz"
  sha256 "a00be88de601d7c5b0d29237a342a2ea55726d8b169faefc79102ec965a2202d"
  license "NCSA"
  head "https://github.com/UIUCLibrary/tripwire.git", branch: "main"

  bottle do
    root_url "https://nexus.library.illinois.edu/repository/homebrew-bottles/"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "137ca305cafcd5d3f12e6da5d534e6451dbca8e4204cfeb44e1f330ae668b6a5"
    sha256 cellar: :any_skip_relocation, sonoma:      "0c0e33a4804ec4fd9b070b3075ac8a2492be5bdc02693a3a059f111e97bc88a8"
  end

  depends_on "conan" => :build
  depends_on "python@3.14"

  resource "argcomplete" do
    url "https://files.pythonhosted.org/packages/16/0f/861e168fc813c56a78b35f3c30d91c6757d1fd185af1110f1aec784b35d0/argcomplete-3.6.2.tar.gz"
    sha256 "d0519b1bc867f5f4f4713c41ad0aba73a4a5f007449716b16f385f2166dc6adf"
  end

  resource "pymediainfo" do
    url "https://files.pythonhosted.org/packages/4d/80/80a6fb21005b81e30f6193d45cba13857df09f5d483e0551fa6fbb3aaeed/pymediainfo-7.0.1.tar.gz"
    sha256 "0d5df59ecc615e24c56f303b8f651579c6accab7265715e5d429186d7ba21514"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
  end

  resource "uiucprescon-pymediaconch" do
    url "https://github.com/UIUCLibrary/uiucprescon.pymediaconch/releases/download/v0.1.2/uiucprescon_pymediaconch-0.1.2.tar.gz"
    sha256 "97cd9b95d521b6541359b34c9097a796cbeb69e4a0aec80786ffaa34722c4390"
  end

  def install
    ENV["CONAN_HOME"] = buildpath
    system "conan", "profile", "detect"
    virtualenv_install_with_resources
  end

  test do
    system bin/"tripwire", "--help"
    system bin/"tripwire", "--version"
  end
end
