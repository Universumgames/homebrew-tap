cask "claude-battery" do
  version "1.0.0"
  sha256 "6feef0bb710d724374b780abc29eebdd8454cbf90647f6adaa10f726d49fbf2f"

  url "https://github.com/Universumgames/Claude_Battery/releases/download/v#{version}/ClaudeBattery.app.zip"
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
