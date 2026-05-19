cask "saspro" do
  version "1.16.5"

  on_arm do
    url "https://github.com/setiastro/setiastrosuitepro/releases/download/V#{version}/SetiAstroSuitePro_AppleSilicon.dmg"
    sha256 "070979cd677c99ca910cfb636582013d4222a53ad6834e9bf479d596f0551a7b"  # paste full hash here
  end

  on_intel do
    url "https://github.com/setiastro/setiastrosuitepro/releases/download/V#{version}/SetiAstroSuitePro_macOS_Intel.dmg"
    sha256 "e4b5ac3f573a6c9663532d59daf28178836563bd358a4bba5a2c1a20aede0d29"  # paste full hash here
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