# typed: true
# frozen_string_literal: true

class GalateaBeta < Formula
  include Language::Python::Virtualenv

  desc "Used for cleaning up metadata used by UIUC metadata. Prerelease"
  homepage "https://github.com/UIUCLibrary/galatea"
  url "https://github.com/UIUCLibrary/galatea/archive/refs/tags/v0.4.0b0.tar.gz"
  sha256 "ebdc79e807b3c0cf1041297dfaad9dd51ca179072a9562856600fbc382c10ca9"
  license "NCSA"
  head "https://github.com/UIUCLibrary/galatea.git", branch: "main"
  depends_on "python@3.13"
  conflicts_with "uiuclibrary/uiucprescon/galatea",
                 because: "galatea beta and galatea formula share same command line application"

  resource "argcomplete" do
    url "https://files.pythonhosted.org/packages/16/0f/861e168fc813c56a78b35f3c30d91c6757d1fd185af1110f1aec784b35d0/argcomplete-3.6.2.tar.gz"
    sha256 "d0519b1bc867f5f4f4713c41ad0aba73a4a5f007449716b16f385f2166dc6adf"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/e8/9e/c05b3920a3b7d20d3d3310465f50348e5b3694f4f88c6daf736eef3024c4/certifi-2025.4.26.tar.gz"
    sha256 "0a816057ea3cdefcef70270d2c515e4506bbc954f417fa5ade2021213bb8f0c6"
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
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/8a/78/16493d9c386d8e60e442a35feac5e00f0913c0f4b7c217c11e8ec2ff53e0/urllib3-2.4.0.tar.gz"
    sha256 "414bc6535b787febd7567804cc015fee39daab8ad86268f1310a9250697de466"
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
