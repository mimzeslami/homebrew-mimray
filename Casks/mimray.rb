cask "mimray" do
  version "0.5.0"
  sha256 "ddfd7946a64af708aeb3588aadaea79e79fab8c7838e05aab36016a906dd1d3b"

  url "https://github.com/mimzeslami/mimray/releases/download/v#{version}/mimray-#{version}-macos.dmg"
  name "mimray"
  desc "Simple, secure V2Ray-compatible VPN client (sing-box core)"
  homepage "https://github.com/mimzeslami/mimray"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "mimray.app"

  # Not notarized yet: clear the download quarantine (on the unpacked copy,
  # before it moves to /Applications) so the app opens normally.
  preflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "mimray.app"],
        must_succeed:   false,
        writable_paths: ["mimray.app"]
  end

  # The optional background helper (installed from the app) runs as root.
  uninstall launchctl: "com.mimray.helper",
            delete:    [
              "/Library/LaunchDaemons/com.mimray.helper.plist",
              "/Library/PrivilegedHelperTools/mimray",
            ]

  zap trash: "~/Library/Application Support/mimray"
end
