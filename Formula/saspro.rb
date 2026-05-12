class Saspro < Formula
  include Language::Python::Virtualenv
  desc "SetiAstro Suite Pro astrophotography image processing platform"
  homepage "https://setiastro.com"
  url "https://github.com/setiastro/setiastrosuitepro/archive/refs/tags/V1.16.0.tar.gz"
  sha256 "dd7703d64d499164359bc097669ca0650eab7915db594306e192c9153e0ac6c5"
  license "GPL-3.0-only"

  depends_on "python@3.12" => :recommended
  depends_on "libomp"

  def python_version
    # Use highest available Python 3.12+ that Homebrew has installed
    ["3.14", "3.13", "3.12"].each do |v|
      return v if Formula["python@#{v}"].any_version_installed? rescue next
    end
    "3.12" # fallback
  end

  def python_bin
    Formula["python@#{python_version}"].opt_bin/"python#{python_version}"
  rescue
    which("python3")
  end

  def install
    pyver = python_version
    python = python_bin

    # Create the venv first suppressing CLT warning
    system "/bin/bash", "-c",
      "#{python} -m venv #{libexec} 2>/dev/null"

    # pip install suppressing CLT warning
    pip = libexec/"bin/python3"
    system "/bin/bash", "-c",
      "#{pip} -m pip install --quiet --no-warn-script-location setiastrosuitepro 2>/dev/null"

    # Ensure worker processes see Numba threading env vars even if env is stripped
    site_packages = libexec/"lib/python#{pyver}/site-packages"
    (site_packages/"sitecustomize.py").write <<~PY
      import os
      os.environ.setdefault("NUMBA_THREADING_LAYER", "omp")
      os.environ.setdefault("NUMBA_NUM_THREADS", "4")
      libomp_lib = "#{Formula["libomp"].opt_lib}"
      current = os.environ.get("DYLD_LIBRARY_PATH", "")
      if libomp_lib not in current.split(":"):
        os.environ["DYLD_LIBRARY_PATH"] = (
          f"{libomp_lib}:{current}" if current else libomp_lib
        )
    PY

    # Wrapper instead of symlink to set Numba threading env vars
    (bin/"setiastrosuitepro").write <<~EOS
      #!/bin/bash
      export NUMBA_THREADING_LAYER=omp
      export NUMBA_NUM_THREADS=4
      export PATH="#{libexec}/bin:${PATH}"
      export PYTHONPATH="#{libexec}/lib/python#{pyver}/site-packages:${PYTHONPATH}"
      export DYLD_LIBRARY_PATH="#{Formula["libomp"].opt_lib}:${DYLD_LIBRARY_PATH}"
      exec "#{libexec}/bin/setiastrosuitepro" "$@"
    EOS
    chmod 0755, bin/"setiastrosuitepro"
  end

  test do
    system bin/"setiastrosuitepro", "--version"
  end
end