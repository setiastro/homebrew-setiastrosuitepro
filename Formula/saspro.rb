class Saspro < Formula
  include Language::Python::Virtualenv
  desc "SetiAstro Suite Pro astrophotography image processing platform"
  homepage "https://setiastro.com"
  url "https://github.com/setiastro/setiastrosuitepro/archive/refs/tags/V1.15.4.tar.gz"
  sha256 "22ba8faaaf1bb6a25193ee458edc357d97acb30f7b87e79fb2faa103c8cb4c5f"
  license "GPL-3.0-only"

  depends_on "python@3.12"

  def install
    python = Formula["python@3.12"].opt_bin/"python3.12"

    # Create the venv first
    system "/bin/bash", "-c",
      "#{python} -m venv #{libexec} 2>/dev/null"

    # Now pip install into it suppressing CLT warning via stderr redirect
    pip = libexec/"bin/python3"
    system "/bin/bash", "-c",
      "#{pip} -m pip install --quiet --no-warn-script-location setiastrosuitepro 2>/dev/null"

    bin.install_symlink libexec/"bin/setiastrosuitepro"
  end

  test do
    system bin/"setiastrosuitepro", "--version"
  end
end