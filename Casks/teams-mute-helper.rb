cask "teams-mute-helper" do
  version "0.8.2"
  sha256 "f62df6d182f8e3e87604d09f1bcf4f051844f73cda164d647312a537a8b941fd"

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
