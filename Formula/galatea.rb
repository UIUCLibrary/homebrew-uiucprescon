# typed: true
# frozen_string_literal: true

class Galatea < Formula
  include Language::Python::Virtualenv

  desc "Used for cleaning up metadata used by UIUC metadata"
  homepage "https://github.com/UIUCLibrary/galatea"
  url "https://github.com/UIUCLibrary/galatea/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "352d009f12fd95a8559cedb59c25ab24e83d77cbb32fde2c921ed9e22e3d9112"
  license "NCSA"
  head "https://github.com/UIUCLibrary/galatea.git", branch: "main"

  bottle do
    root_url "https://nexus.library.illinois.edu/repository/homebrew-bottles/"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2d1d8275afa49dcc4d26444330bfcb0dfb8f6553739889ea99b7726a2b73e762"
    sha256 cellar: :any_skip_relocation, sonoma:       "b5c42bd6f34be1062775fb7f9be1ce060a2f11a8dc477828fe33f83eb47d4785"
  end

  depends_on "python@3.13"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/1c/ab/c9f1e32b7b1bf505bf26f0ef697775960db7932abeb7b516de930ba2705f/certifi-2025.1.31.tar.gz"
    sha256 "3d5da6925056f6f18f119200434a4780a94263f10d1c21d032a6f6b2baa20651"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/16/b0/572805e227f01586461c80e0fd25d65a2115599cc9dad142fee4b747c357/charset_normalizer-3.4.1.tar.gz"
    sha256 "44251f18cd68a75b56585dd00dae26183e102cd5e0f9f1466e6df5da2ed64ea3"
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
    url "https://files.pythonhosted.org/packages/aa/63/e53da845320b757bf29ef6a9062f5c669fe997973f966045cb019c3f4b66/urllib3-2.3.0.tar.gz"
    sha256 "f8c5449b3cf0861679ce7e0503c7b44b5ec981bec0d1d3795a07f1ba96f0204d"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system bin/"galatea", "--help"
    system bin/"galatea", "--version"
  end
end
