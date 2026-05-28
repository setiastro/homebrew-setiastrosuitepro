cask "saspro" do
  version "1.16.12"

  on_arm do
    url "https://github.com/setiastro/setiastrosuitepro/releases/download/V#{version}/SetiAstroSuitePro_AppleSilicon.dmg"
    sha256 "ec756f710ad92ca30f3b78a2540680bc7a78fcc6cf92bbdf56560f22cc4c8d82"  # paste full hash here
  end

  on_intel do
    url "https://github.com/setiastro/setiastrosuitepro/releases/download/V#{version}/SetiAstroSuitePro_macOS_Intel.dmg"
    sha256 "6c977b2636325861a31076e7d8fe487b90ad3f2055d1b558084104c78daaf317"  # paste full hash here
  end

  name "SASpro"
  desc "SetiAstro Suite Pro astrophotography image processing platform"
  homepage "https://setiastro.com"

  depends_on macos: ">= :big_sur"

  app "SetiAstroSuitePro.app"

  zap trash: [
    "~/Library/Application Support/SetiAstroSuitePro",
    "~/Library/Preferences/com.setiastro.setiastrosuitepro.plist",
    "~/Library/Caches/SetiAstroSuitePro",
  ]
end