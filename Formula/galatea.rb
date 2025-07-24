# typed: true
# frozen_string_literal: true

class Galatea < Formula
  include Language::Python::Virtualenv

  desc "Used for cleaning up metadata used by UIUC metadata"
  homepage "https://github.com/UIUCLibrary/galatea"
  url "https://github.com/UIUCLibrary/galatea/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "3d673a2752d32539da8003cbdeca77f7f3d0306a41dd24ff9ce9dd8bd3f098e2"
  license "NCSA"
  head "https://github.com/UIUCLibrary/galatea.git", branch: "main"

  bottle do
    root_url "https://nexus.library.illinois.edu/repository/homebrew-bottles/"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7f9c5c2ec15495484b756d3718a1dd2bab6770a52391fb3f35c8cdc10f19e7f6"
    sha256 cellar: :any_skip_relocation, sonoma:       "1fb075177736c01ed44b55bfc014d98f3ca22207cff5384783c826521d532dfc"
  end

  depends_on "python@3.13"
  conflicts_with "uiuclibrary/uiucprescon/galatea-beta",
                 because: "galatea beta and galatea formula share same command line application"

  resource "argcomplete" do
    url "https://files.pythonhosted.org/packages/16/0f/861e168fc813c56a78b35f3c30d91c6757d1fd185af1110f1aec784b35d0/argcomplete-3.6.2.tar.gz"
    sha256 "d0519b1bc867f5f4f4713c41ad0aba73a4a5f007449716b16f385f2166dc6adf"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/b3/76/52c535bcebe74590f296d6c77c86dabf761c41980e1347a2422e4aa2ae41/certifi-2025.7.14.tar.gz"
    sha256 "8ea99dbdfaaf2ba2f9bac77b9249ef62ec5218e7c2b2e903378ed5fccf765995"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/e4/33/89c2ced2b67d1c2a61c19c6751aa8902d46ce3dacb23600a283619f5a12d/charset_normalizer-3.4.2.tar.gz"
    sha256 "5baececa9ecba31eff645232d59845c07aa030f0c81ee70184a90d35099a0e63"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz"
    sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/e1/0a/929373653770d8a0d7ea76c37de6e41f11eb07559b103b1c02cafb3f7cf8/requests-2.32.4.tar.gz"
    sha256 "27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/15/22/9ee70a2574a4f4599c47dd506532914ce044817c7752a79b6a51286319bc/urllib3-2.5.0.tar.gz"
    sha256 "3fc47733c7e419d4bc3f6b3dc2b4f890bb743906a30d56ba4a5bfa4bbff92760"
  end

  def install
    virtualenv_install_with_resources

    generate_completions_from_executable(
      libexec/"bin/register-python-argcomplete", "galatea",
      base_name:              "galatea",
      shell_parameter_format: :arg
    )
  end

  test do
    system bin/"galatea", "--help"
    system bin/"galatea", "--version"
  end
end
