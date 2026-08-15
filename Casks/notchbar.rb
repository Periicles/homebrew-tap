cask "notchbar" do
  version "0.3.0"
  sha256 "1bc521165e99acda4293e0b06c70730a1a88106a891909a0b4fbb0c0aaa84828"

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

  # Sandboxed app: all its data lives in the container.
  zap trash: "~/Library/Containers/com.periicles.NotchBar"
end
