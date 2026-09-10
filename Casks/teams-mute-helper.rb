cask "teams-mute-helper" do
  version "0.6.0"
  sha256 "d6e700c176d52085f2fafb11de2daa1d561a10ae4c82b7b34dacb563ee006cd9"

  url "https://github.com/m-rk/ms-teams-mute-shortcut/releases/download/v#{version}/Teams-Mute-Helper-#{version}.zip"
  name "Teams Mute Helper"
  desc "Toggle Microsoft Teams mute with a global keyboard shortcut"
  homepage "https://github.com/m-rk/ms-teams-mute-shortcut"

  depends_on macos: :ventura

  app "Teams Mute Helper.app"

  uninstall quit:   "io.github.m-rk.ms-teams-mute-helper",
            script: {
              executable:   "Teams Mute Helper.app/Contents/MacOS/TeamsMuteHelper",
              args:         ["--unregister-login-item"],
              must_succeed: false,
            }

  zap trash: [
    "~/Library/Logs/Teams Mute Helper.log",
    "~/Library/Preferences/io.github.m-rk.ms-teams-mute-helper.plist",
  ]

  caveats <<~EOS
    Open Teams Mute Helper once, then allow it in:
      System Settings > Privacy & Security > Accessibility

    The app enables its native Launch at Login item on first launch.
  EOS
end
