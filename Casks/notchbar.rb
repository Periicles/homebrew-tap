cask "notchbar" do
  version "0.2.0"
  sha256 "ece2f64fdb9cc955d894b673987299e3ea030bf6b3cc50d9ba44e6655a8143f8"

  url "https://github.com/Periicles/Notchapp/releases/download/v#{version}/NotchBar.dmg"
  name "NotchBar"
  desc "Shows the current calendar event's progress in the MacBook notch"
  homepage "https://github.com/Periicles/Notchapp"

  # Releases are GitHub pre-releases for now, which the release strategies skip,
  # so track the version tags directly.
  livecheck do
    url "https://github.com/Periicles/Notchapp.git"
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  # NotchBar is ad-hoc signed and not yet Apple-notarized, so a quarantined copy
  # is rejected by Gatekeeper. Install with `--no-quarantine` to launch it directly:
  #   brew install --cask --no-quarantine notchbar
  # Once Developer ID notarization ships this note (and the flag) go away.
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "NotchBar.app"

  uninstall quit: "com.periicles.NotchBar"

  zap trash: "~/Library/Preferences/com.periicles.NotchBar.plist"
end
