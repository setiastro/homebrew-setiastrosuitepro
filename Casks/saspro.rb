cask "saspro" do
  version "1.21.6"

  on_arm do
    url "https://github.com/setiastro/setiastrosuitepro/releases/download/V#{version}/SetiAstroSuitePro_AppleSilicon.dmg"
    sha256 "ed277aaa999e89ef4335fb36da689f1b7b510b8b35ec1f81baa0cd0928d6629c"  # paste full hash here
  end

  on_intel do
    url "https://github.com/setiastro/setiastrosuitepro/releases/download/V#{version}/SetiAstroSuitePro_macOS_Intel.dmg"
    sha256 "bc6cb4ad9dbfaca0688d35962fde8f4f3e92016e2a7d910537b01c1b1da9d874"  # paste full hash here
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