class Saspro < Formula
  include Language::Python::Virtualenv
  desc "SetiAstro Suite Pro astrophotography image processing platform"
  homepage "https://setiastro.com"
  url "https://github.com/setiastro/setiastrosuitepro/archive/refs/tags/V1.15.4.tar.gz"
  sha256 "22ba8faaaf1bb6a25193ee458edc357d97acb30f7b87e79fb2faa103c8cb4c5f"
  license "GPL-3.0-only"

  depends_on "python@3.12"

  def install
    # Redirect stderr to suppress CLT version warning that Homebrew
    # incorrectly treats as fatal on macOS 15 with Xcode 26 naming
    pip = libexec/"bin/python3"
    safe_system "/bin/bash", "-c",
      "#{pip} -m pip install --quiet --no-warn-script-location setiastrosuitepro 2>/dev/null || " \
      "#{pip} -m pip install --quiet --no-warn-script-location setiastrosuitepro"

    bin.install_symlink libexec/"bin/setiastrosuitepro"
  end

  test do
    system bin/"setiastrosuitepro", "--version"
  end
end