# Forumula for testing distribution of a pyside6 app
class Pyside6Test < Formula # rubocop:disable Metrics/ClassLength
  include Language::Python::Virtualenv
  desc "Test for pyside6"
  homepage "https://github.com/UIUCLibrary/SamplePyside6App"
  url "https://github.com/UIUCLibrary/SamplePyside6App/archive/refs/tags/0.1.tar.gz"
  sha256 "71a8d6ac675d60e94ca150737ca386a4492ca6615b0de693c40d4e9584cb4262"
  head "https://github.com/henryborchers/hellopyside6.git", branch: "main"

  bottle do
    root_url "https://jenkins.library.illinois.edu/nexus/repository/homebrew-bottles-beta/beta/"
    sha256 cellar: :any, catalina: "87c0dc3c5bde7f3413415ac7500a1d9c31ac9da6cf40baa53bd7cff38c053339"
  end

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on xcode: :build
  depends_on "llvm"
  depends_on "python@3.10"
  depends_on "qt"

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/df/9e/d1a7217f69310c1db8fdf8ab396229f55a699ce34a203691794c5d1cad0c/packaging-21.3.tar.gz"
    sha256 "dd47c42927d89ab911e606518907cc2d3a1f38bbd026385970643f9c5b8ecfeb"
  end

  resource "pyside6" do
    url "https://download.qt.io/official_releases/QtForPython/pyside6/PySide6-6.2.3-src/pyside-setup-opensource-src-6.2.3.tar.xz"
    sha256 "70d55e8fe977ffe094bba51119d16d37e0736df8693787110b127a2b4bd00003"
  end

  def install
    venv = virtualenv_create(libexec, "python3")
    system "#{libexec}/bin/python", "-m", "pip", "install", "pip", "--upgrade"
    system "#{libexec}/bin/pip", "install", "setuptools", "--upgrade"

    resource("pyside6").stage do
      pyside_args = %w[
        --no-examples
        --no-qt-tools
        --rpath @loader_path/../shiboken6
        --shorter-paths
        --skip-docs
        --verbose-build
        --module-subset=Core,Gui,Widgets,Network,Qml,OpenGL,Quick
      ]
      # venv.pip_install resource ("packaging")
      system "#{libexec}/bin/pip", "install", "packaging"
      system "#{libexec}/bin/python", *Language::Python.setup_install_args(prefix), *pyside_args
    end

    venv.pip_install_and_link buildpath
  end

  test do
    modules = %w[
      Core
      Gui
      Widgets
      Network
      Qml
      OpenGL
      Quick
    ]
    modules.each { |mod| system "#{libexec}/bin/python", "-c", "import PySide6.Qt#{mod}" }
    system "#{libexec}/bin/pip", "check"
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test HathiZip`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    # system "false"
  end
end
