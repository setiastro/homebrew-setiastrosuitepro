cask "saspro" do
  version "1.21.0"

  on_arm do
    url "https://github.com/setiastro/setiastrosuitepro/releases/download/V#{version}/SetiAstroSuitePro_AppleSilicon.dmg"
    sha256 "797e3be64a69f80fbdaf677b487486a03b44f2fddac2cdb9a8b65baf9845dd79"  # paste full hash here
  end

  on_intel do
    url "https://github.com/setiastro/setiastrosuitepro/releases/download/V#{version}/SetiAstroSuitePro_macOS_Intel.dmg"
    sha256 "499a3a7a699cce2d9a46491865e4f4fae35ca188cfc2a46aa204f42f8cd8d65b"  # paste full hash here
  end

  name "SASpro"
  desc "SetiAstro Suite Pro astrophotography image processing platform"
  homepage "https://setiastro.com"

  depends_on macos: :monterey

  app "SetiAstroSuitePro.app"

  zap trash: [
    "~/Library/Application Support/SetiAstroSuitePro",
    "~/Library/Preferences/com.setiastro.setiastrosuitepro.plist",
    "~/Library/Caches/SetiAstroSuitePro",
  ]
end