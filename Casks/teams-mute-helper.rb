cask "teams-mute-helper" do
  version "0.9.0"
  sha256 "6bd23bde162c009eec39f764b57f9aa9c675bdd9520badc017f6ea29b0c47cd9"

  url "https://github.com/m-rk/ms-teams-mute-shortcut/releases/download/v#{version}/Teams-Mute-Helper-#{version}.zip"
  name "Teams Mute Helper"
  desc "Toggle Microsoft Teams mute with a global keyboard shortcut"
  homepage "https://github.com/m-rk/ms-teams-mute-shortcut"

  depends_on macos: :ventura

  app "Teams Mute Helper.app"

  uninstall quit:   "io.github.m-rk.ms-teams-mute-helper",
            script: {
              executable:   "#{appdir}/Teams Mute Helper.app/Contents/MacOS/TeamsMuteHelper",
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
