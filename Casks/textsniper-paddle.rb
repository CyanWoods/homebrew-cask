cask "textsniper-paddle" do
  version "1.11"
  sha256 "701515743423d8189b714e04d745db72027080cfeffc0c733118c338e397fcaa"

  url "https://s3.amazonaws.com/textsniper.app/TextSniper#{version}.dmg"
  name "TextSniper@paddle"
  desc "Extract text from images and other digital documents"
  homepage "https://textsniper.app/"

  livecheck do
    url "https://textsniper.app/api/downloads/mac-latest"
    strategy :header_match
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  app "TextSniper.app"

  uninstall  launchctl: "com.valerijs.boguckis.gumroad.TextSniper-LaunchAtLoginHelper",
             quit:      "com.valerijs.boguckis.gumroad.TextSniper",
             delete:    "/Applications/TextSniper.app"

  zap trash: [
    "~/Library/Application Scripts/com.valerijs.boguckis.gumroad.TextSniper-LaunchAtLoginHelper",
    "~/Library/Application Support/com.valerijs.boguckis.gumroad.TextSniper",
    "~/Library/Application Support/TextSniper",
    "~/Library/Caches/com.valerijs.boguckis.gumroad.TextSniper",
    "~/Library/Containers/com.valerijs.boguckis.gumroad.TextSniper-LaunchAtLoginHelper",
    "~/Library/Preferences/com.valerijs.boguckis.gumroad.TextSniper.plist",
  ]

end
