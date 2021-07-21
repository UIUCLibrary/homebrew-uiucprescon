# typed: true
# frozen_string_literal: true

# Forumula for building Speedwagon for distribution via Homebrew
class Speedwagon < Formula # rubocop:disable Metrics/ClassLength
  include Language::Python::Virtualenv
  desc "Collection of tools and workflows for DS"
  homepage "https://github.com/UIUCLibrary/Speedwagon"
  url "https://github.com/UIUCLibrary/Speedwagon/archive/refs/tags/0.1.6.tar.gz"
  sha256 "1949dfa17d659be351c4ad9ae09074d4f469742b8351d29698e45b1d71656c14"
  version_scheme 1
  head "https://github.com/UIUCLibrary/Speedwagon.git"

  bottle do
    root_url "https://jenkins.library.illinois.edu/nexus/repository/homebrew-bottles/release/"
    sha256 cellar: :any, catalina: "c50f97fdad43c4ef6c3f6ab13f3caaa50bc736f1d490c543406c476f4de2bf8a"
  end

  depends_on "cmake" => :build
  depends_on "conan" => :build
  depends_on "python@3.9"
  depends_on "qt@5"
  depends_on "sip"

  resource "uiucprescon.images" do
    url "https://github.com/UIUCLibrary/uiucprescon.images/archive/v0.0.4.tar.gz"
    sha256 "6c17cca6094222a98c42200fe7e9c55118d5234a53f091812c699e9a56f076fd"
  end

  resource "uiucprescon.packager" do
    url "https://github.com/UIUCLibrary/Packager/archive/v0.2.13.tar.gz"
    sha256 "97e9ba3428fc5fbc6612ac2b67d833958f2d4f230c253d835511dcdd37d9e008"
  end

  resource "uiucprescon.ocr" do
    url "https://github.com/UIUCLibrary/Tesseract_Glue/archive/v0.1.2.tar.gz"
    sha256 "9936ef752eb3a46e018fa279070262ffc8dc8d4285bfe8382fda40c854a4a1ec"
  end

  resource "HathiValidate" do
    url "https://github.com/UIUCLibrary/HathiValidate/archive/v0.3.6.tar.gz"
    sha256 "2e4db46925878956bdd0c454617f37da86321642384caf2ae535feba96a1d757"
  end

  resource "pyhathiprep" do
    url "https://github.com/UIUCLibrary/pyhathiprep/archive/v0.1.5.tar.gz"
    sha256 "a6d1295eabf0e21bf42e6949070a69b4b9e4f368f9ff5f0f3f785709e9000d23"
  end

  resource "HathiZip" do
    url "https://github.com/UIUCLibrary/HathiZip/archive/v0.1.9.tar.gz"
    sha256 "40753f5325f9b31fca2a7fb51fa6626db0ca29fa43a1183b4b333fbec7d798c7"
  end

  resource "py3exiv2bind" do
    url "https://github.com/UIUCLibrary/pyexiv2bind/archive/v0.1.7.tar.gz"
    sha256 "20740541b630eab78f3f132621c647f57837b85485fcf07a20e6c0b6370f18e3"
  end

  resource "uiucprescon.imagevalidate" do
    url "https://github.com/UIUCLibrary/imagevalidate/archive/v0.1.6.tar.gz"
    sha256 "52d80f8ee1f071b35fb19cc2c85808d0f636923452f23a60aa6c1b7febdf2a6b"
  end

  # ==================================================
  # Third party
  # ==================================================
  resource "PyQt5" do
    url "https://files.pythonhosted.org/packages/8e/a4/d5e4bf99dd50134c88b95e926d7b81aad2473b47fde5e3e4eac2c69a8942/PyQt5-5.15.4.tar.gz"
    sha256 "2a69597e0dd11caabe75fae133feca66387819fc9bc050f547e5551bce97e5be"
  end

  resource "PyQt5-sip" do
    url "https://files.pythonhosted.org/packages/b1/40/dd8f081f04a12912b65417979bf2097def0af0f20c89083ada3670562ac5/PyQt5_sip-12.9.0.tar.gz"
    sha256 "d3e4489d7c2b0ece9d203ae66e573939f7f60d4d29e089c9f11daa17cfeaae32"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/a0/a4/d63f2d7597e1a4b55aa3b4d6c5b029991d3b824b5bd331af8d4ab1ed687d/PyYAML-5.4.1.tar.gz"
    sha256 "607774cbba28732bfa802b54baa7484215f530991055bb562efbed5b2f20a45e"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/06/a9/cd1fd8ee13f73a4d4f491ee219deeeae20afefa914dfb4c130cfc9dc397a/certifi-2020.12.5.tar.gz"
    sha256 "1a4995114262bffbc2413b159f2a1a480c969de6e6eb13ee966d470af86af59c"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/ee/2d/9cdc2b527e127b4c9db64b86647d567985940ac3698eeabc7ffaccb4ea61/chardet-4.0.0.tar.gz"
    sha256 "0d6f53a15db4120f2b08c94f11e7d93d2c911ee118b6b30a04ec3ee8310179fa"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/ea/b7/e0e3c1c467636186c39925827be42f16fee389dc404ac29e930e9136be70/idna-2.10.tar.gz"
    sha256 "b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/e5/21/a2e4517e3d216f0051687eea3d3317557bde68736f038a3b105ac3809247/lxml-4.6.3.tar.gz"
    sha256 "39b78571b3b30645ac77b95f7c69d1bffc4cf8c3b157c435a34da72e78c82468"
  end

  resource "pytz" do
    url "https://files.pythonhosted.org/packages/b0/61/eddc6eb2c682ea6fd97a7e1018a6294be80dba08fa28e7a3570148b4612d/pytz-2021.1.tar.gz"
    sha256 "83a4a90894bf38e243cf052c8b58f381bfe9a7a483f6a9cab140bc7f702ac4da"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/6b/47/c14abc08432ab22dc18b9892252efaf005ab44066de871e72a38d6af464b/requests-2.25.1.tar.gz"
    sha256 "27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804"
  end

  resource "ruamel.yaml" do
    url "https://files.pythonhosted.org/packages/62/cf/148028462ab88a71046ba0a30780357ae9e07125863ea9ca7808f1ea3798/ruamel.yaml-0.17.4.tar.gz"
    sha256 "44bc6b54fddd45e4bc0619059196679f9e8b79c027f4131bb072e6a22f4d5e28"
  end

  resource "ruamel.yaml.clib" do
    url "https://files.pythonhosted.org/packages/fa/a1/f9c009a633fce3609e314294c7963abe64934d972abea257dce16a15666f/ruamel.yaml.clib-0.2.2.tar.gz"
    sha256 "2d24bd98af676f4990c4d715bcdc2a60b19c56a3fb3a763164d2d8ca0e806ba7"
  end

  resource "tzlocal" do
    url "https://files.pythonhosted.org/packages/ce/73/99e4cc30db6b21cba6c3b3b80cffc472cc5a0feaf79c290f01f1ac460710/tzlocal-2.1.tar.gz"
    sha256 "643c97c5294aedc737780a49d9df30889321cbe1204eac2c2ec6134035a92e44"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/cb/cf/871177f1fc795c6c10787bc0e1f27bb6cf7b81dbde399fd35860472cecbc/urllib3-1.26.4.tar.gz"
    sha256 "e7b021f7241115872f92f43c6508082facffbd1c048e3c6e2bb9c2a157e28937"
  end

  def install
    venv = virtualenv_create(libexec, "python3")
    install_special
    venv.pip_install third_party_python_deps
    venv.pip_install first_party_python_deps
    venv.pip_install_and_link buildpath

    system "#{libexec}/bin/pip", "list"
    system "#{libexec}/bin/pip", "check"
  end

  test do
    system "#{libexec}/bin/pip", "check"
    system "#{bin}/speedwagon", "--version"
  end

  private

  def install_special
    resource("uiucprescon.packager").stage do
      system "#{libexec}/bin/pip", "install", "-v", "--no-deps", "--no-binary", ":all:",
             "--ignore-installed", "#{Pathname.pwd}[kdu]"
    end

    # system "#{libexec}/bin/pip", "install", "-v", "PyQt5-Qt==5.15.2"
    system "#{libexec}/bin/pip", "install", "-v", "--no-deps", "--no-binary", ":all:",
           "--ignore-installed", "pykdu-compress==0.1.5", "-i",
           "https://devpi.library.illinois.edu/production/release/+simple/"
  end

  def third_party_python_deps # rubocop:disable Metrics/MethodLength
    [
      resource("idna"),
      resource("certifi"),
      resource("urllib3"),
      resource("requests"),
      resource("ruamel.yaml"),
      resource("ruamel.yaml.clib"),
      resource("tzlocal"),
      resource("PyYAML"),
      resource("pytz"),
      resource("chardet"),
      resource("lxml"),
      resource("PyQt5"),
      resource("PyQt5-sip"),
    ]
  end

  def first_party_python_deps
    [
      resource("uiucprescon.ocr"),
      resource("HathiValidate"),
      resource("HathiZip"),
      resource("py3exiv2bind"),
      resource("pyhathiprep"),
      resource("uiucprescon.images"),
      resource("uiucprescon.imagevalidate"),
    ]
  end
end
