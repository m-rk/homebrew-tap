cask "teams-mute-helper" do
  version "0.8.0"
  sha256 "370325943511cb327970b1c57ec83ed9dc0644d71f0611ecbc9e01de2b3c9cd2"

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
