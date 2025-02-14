# typed: true
# frozen_string_literal: true

class Tripwire < Formula
  include Language::Python::Virtualenv

  desc "Used for helping out AV preservation"
  homepage "https://github.com/UIUCLibrary/tripwire"
  url "https://github.com/UIUCLibrary/tripwire/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "af04e31a9479152cbd821758a6ab58a150f1b46d6ada244f316e7d6396a8e5da"
  license "NCSA"
  head "https://github.com/UIUCLibrary/tripwire.git", branch: "main"

  bottle do
    root_url "https://nexus.library.illinois.edu/repository/homebrew-bottles/"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "634fa662c44105e50357798612902087909f89af83c348ddbce2e2316a9006ee"
    sha256 cellar: :any_skip_relocation, sonoma:       "3cdbbdcc2df76bfd04c1cbd321171763c6f53ba4f925f1a3e8c91931015f79fa"
  end

  depends_on "python@3.13"

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
