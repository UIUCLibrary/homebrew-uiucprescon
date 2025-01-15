# typed: true
# frozen_string_literal: true

class Galatea < Formula
  include Language::Python::Virtualenv

  desc "Used for cleaning up metadata used by UIUC metadata"
  homepage "https://github.com/UIUCLibrary/galatea"
  url "https://github.com/UIUCLibrary/galatea/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "9655357cfb90fef16cc1f425e24a953ae6a00466c3981d8499a840b02ca1869d"
  license "NCSA"
  head "https://github.com/UIUCLibrary/galatea.git", branch: "main"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/galatea", "--help"
    system "#{bin}/galatea", "--version"
  end
end
