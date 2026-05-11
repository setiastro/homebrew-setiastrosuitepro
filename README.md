```markdown
# homebrew-setiastrosuitepro

Official Homebrew tap for [SetiAstro Suite Pro](https://setiastro.com) — an advanced astrophotography toolkit for image calibration, stacking, registration, photometry, and visualization.

## Installation

First, add the tap:

```bash
brew tap setiastro/setiastrosuitepro
```

### Cask (Recommended)

Installs the pre-built signed and notarized DMG. Works on macOS 12 Monterey and later. Homebrew automatically selects the correct build for your Mac (Apple Silicon or Intel).

```bash
brew install --cask saspro
```

To update:
```bash
brew upgrade --cask saspro
```

To uninstall:
```bash
brew uninstall --cask saspro
```

### Formula (Build from Source)

For developers and power users who want to install directly from the PyPI source package.

```bash
brew install --formula saspro
```

To launch after formula install:
```bash
setiastrosuitepro
```

To update:
```bash
brew upgrade --formula saspro
```

To uninstall:
```bash
brew uninstall --formula saspro
```

## Requirements

### Cask
- macOS 12 Monterey or later
- Apple Silicon or Intel Mac

### Formula
- macOS 12 Monterey or later  
- Homebrew Python 3.12
- OpenMP (`libomp`) — installed automatically as a dependency

## Notes

### imagecodecs Warning
During formula installation you may see a warning about `imagecodecs/.dylibs/libgif.7.2.0.dylib`. This is a known cosmetic issue with how Homebrew tries to rewrite bundled library paths inside Python wheels. It does not affect runtime functionality — SASpro launches and runs correctly despite this warning.

### Command Line Tools Warning
On macOS 15 Sequoia you may see a warning about Command Line Tools for Xcode 26.3. This is a Homebrew display issue related to Apple's version numbering change (Xcode 26 = the Xcode release for macOS 15). The formula handles this automatically and installation will complete successfully.

### Numba Threading
The formula automatically configures Numba to use the OpenMP threading layer (`NUMBA_THREADING_LAYER=omp`) which is required for stable operation when SASpro's parallel image processing functions are called from multiple threads simultaneously. This is handled transparently — no user configuration is needed.

## Cask vs Formula — Which Should I Use?

| | Cask | Formula |
|---|---|---|
| Install type | Pre-built DMG | Built from PyPI source |
| Install time | Fast (~400MB download) | Slower (~1.6GB with all deps) |
| Launches as | macOS .app in /Applications | Terminal command |
| Best for | Most users | Developers / power users |
| macOS requirement | 12+ | 12+ |

## Links

- [SetiAstro Suite Pro Website](https://setiastro.com)
- [GitHub Repository](https://github.com/setiastro/setiastrosuitepro)
- [Releases](https://github.com/setiastro/setiastrosuitepro/releases)
- [PyPI Package](https://pypi.org/project/setiastrosuitepro)
- [Discord Community](https://discord.gg/pJEUgdmwvY)

## Issues

If you encounter issues with the Homebrew tap itself (cask or formula definitions), please open an issue in this repository:  
[https://github.com/setiastro/homebrew-setiastrosuitepro/issues](https://github.com/setiastro/homebrew-setiastrosuitepro/issues)

For issues with SASpro itself, please use the main repository:  
[https://github.com/setiastro/setiastrosuitepro/issues](https://github.com/setiastro/setiastrosuitepro/issues)

## Credits

Formula and cask maintained by [Franklin Marek](https://setiastro.com).  
Special thanks to Tim (BinaryAstro_Tim) for his contributions to solving the Numba OpenMP threading configuration for the formula install.
```
