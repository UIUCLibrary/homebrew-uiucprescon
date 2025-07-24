# typed: true
# frozen_string_literal: true

class Tripwire < Formula
  include Language::Python::Virtualenv

  desc "Used for helping out AV preservation"
  homepage "https://github.com/UIUCLibrary/tripwire"
  url "https://github.com/UIUCLibrary/tripwire/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "f8fa0e8f0eda37b0f9adfa68a670f6dbd4b557f5c16f884cd31debfe967507a9"
  license "NCSA"
  head "https://github.com/UIUCLibrary/tripwire.git", branch: "main"

  bottle do
    root_url "https://nexus.library.illinois.edu/repository/homebrew-bottles/"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "1757f8709f429e246f3901d44c34a8a47813c04439a96169b20e20fb2e4e19d5"
    sha256 cellar: :any_skip_relocation, sonoma:       "db101c104ffea9e0fc7c06f807331b858148c3abcd135233c61e45f9fdea8eb7"
  end

  depends_on "python@3.13"

  resource "argcomplete" do
    url "https://files.pythonhosted.org/packages/16/0f/861e168fc813c56a78b35f3c30d91c6757d1fd185af1110f1aec784b35d0/argcomplete-3.6.2.tar.gz"
    sha256 "d0519b1bc867f5f4f4713c41ad0aba73a4a5f007449716b16f385f2166dc6adf"
  end

  resource "tqdm" do
    url "https://files.pythonhosted.org/packages/a8/4b/29b4ef32e036bb34e4ab51796dd745cdba7ed47ad142a9f4a1eb8e0c744d/tqdm-4.67.1.tar.gz"
    sha256 "f8aef9c52c08c13a65f30ea34f4e5aac3fd1a34959879d7e59e63027286627f2"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"tripwire", "--help"
    system bin/"tripwire", "--version"
  end
end
