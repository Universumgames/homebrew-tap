cask "claude-battery" do
  version "1.1"
  sha256 "3c676fa1348b82c44ac4f8058d1136ae8e6e180b8a2654b0ba46abf25708600a"

  url "https://github.com/Universumgames/Claude_Battery/releases/download/v#{version}/ClaudeBattery.dmg"
  name "ClaudeBattery"
  desc "Menu bar app showing your claude.ai Pro/Max usage as a battery icon"
  homepage "https://github.com/Universumgames/Claude_Battery"

  depends_on macos: :ventura

  app "ClaudeBattery.app"

  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-cr", "#{appdir}/ClaudeBattery.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Caches/de.universegame.ClaudeBattery",
    "~/Library/Preferences/de.universegame.ClaudeBattery.plist",
  ]

  caveats <<~EOS
    This build is signed with an Apple Development certificate, not notarized
    by Apple. The postflight step already clears the quarantine attribute, but
    if macOS still calls it "damaged" or unidentified, right-click the app in
    /Applications and choose "Open" once.
  EOS
end
