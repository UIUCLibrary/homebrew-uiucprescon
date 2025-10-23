# typed: true
# frozen_string_literal: true

class Tripwire < Formula
  include Language::Python::Virtualenv

  desc "Used for helping out AV preservation"
  homepage "https://github.com/UIUCLibrary/tripwire"
  url "https://github.com/UIUCLibrary/tripwire/releases/download/v0.3.6/uiucprescon_tripwire-0.3.6.tar.gz"
  sha256 "21a11faa0378c5d87c15a41c93f4c0858913e9b0a44df0c5f45fcbd4eaf13587"
  license "NCSA"
  head "https://github.com/UIUCLibrary/tripwire.git", branch: "main"

  bottle do
    root_url "https://nexus.library.illinois.edu/repository/homebrew-bottles/"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1be2b581af38f9249d236d9f475767d4ec7e6deb5b753bf2805d40a4330dbc35"
    sha256 cellar: :any_skip_relocation, sonoma:        "83188c07abae564d2aaeb44259d31f0003fa20d3f18c855737125fa934a2aa03"
  end

  depends_on "python@3.13"

  resource "argcomplete" do
    url "https://files.pythonhosted.org/packages/38/61/0b9ae6399dd4a58d8c1b1dc5a27d6f2808023d0b5dd3104bb99f45a33ff6/argcomplete-3.6.3.tar.gz"
    sha256 "62e8ed4fd6a45864acc8235409461b72c9a28ee785a2011cc5eb78318786c89c"
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
    url "https://github.com/UIUCLibrary/uiucprescon.pymediaconch/releases/download/v0.1.1/uiucprescon_pymediaconch-0.1.1.tar.gz"
    sha256 "c7b3217e59aab7d772352baa230f1628dccaf66ab8f4806840e11feab4ca55fd"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"tripwire", "--help"
    system bin/"tripwire", "--version"
  end
end
