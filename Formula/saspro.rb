class Saspro < Formula
  include Language::Python::Virtualenv
  desc "SetiAstro Suite Pro astrophotography image processing platform"
  homepage "https://setiastro.com"
  url "https://github.com/setiastro/setiastrosuitepro/archive/refs/tags/V1.15.4.tar.gz"
  sha256 "22ba8faaaf1bb6a25193ee458edc357d97acb30f7b87e79fb2faa103c8cb4c5f"
  license "GPL-3.0-only"

  depends_on "python@3.12"
  depends_on "tbb"

  def install
    ENV["HOMEBREW_NO_INSTALL_CLEANUP"] = "1"
    ENV["HOMEBREW_NO_ENV_HINTS"] = "1"
    ENV["HOMEBREW_NO_AUTO_UPDATE"] = "1"
    ENV["PYTHONDONTWRITEBYTECODE"] = "1"

    # Use pipe to suppress CLT warnings being treated as errors
    pip = libexec/"bin/python3"
    system pip, "-m", "pip", "install",
           "--quiet",
           "--no-warn-script-location",
           "--no-build-isolation",
           "--disable-pip-version-check",
           "setiastrosuitepro"

    rm_f bin/"setiastrosuitepro"

    (bin/"setiastrosuitepro").write <<~EOS
      #!/bin/bash
      export NUMBA_THREADING_LAYER=omp
      export NUMBA_NUM_THREADS=1
      exec "#{libexec}/bin/setiastrosuitepro" "$@"
    EOS
    chmod 0755, bin/"setiastrosuitepro"
  end

  test do
    system bin/"setiastrosuitepro", "--version"
  end
end