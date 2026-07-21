cask "saspro" do
  version "1.19.10"

  on_arm do
    url "https://github.com/setiastro/setiastrosuitepro/releases/download/V#{version}/SetiAstroSuitePro_AppleSilicon.dmg"
    sha256 "c885ad6613a025af7974a02f4a1f7e0e0b8731741b937c0172a75df4ca48d6fa"  # paste full hash here
  end

  on_intel do
    url "https://github.com/setiastro/setiastrosuitepro/releases/download/V#{version}/SetiAstroSuitePro_macOS_Intel.dmg"
    sha256 "3ee643cea431e23c7ca49087cb787bac87634819b0a94bae4e84fb9192bef0c9"  # paste full hash here
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