cask "notchbar" do
  version "0.3.0"
  sha256 "1bc521165e99acda4293e0b06c70730a1a88106a891909a0b4fbb0c0aaa84828"

  url "https://github.com/Periicles/Notchapp/releases/download/v#{version}/NotchBar.dmg"
  name "NotchBar"
  desc "Shows the current calendar event's progress in the MacBook notch"
  homepage "https://github.com/Periicles/Notchapp"

  # Track version tags directly: robust whether or not a given release is
  # marked stable, which the github_latest strategy is not.
  livecheck do
    url "https://github.com/Periicles/Notchapp.git"
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  # NotchBar is ad-hoc signed. Notarization needs a paid Apple Developer ID and
  # is not planned, so a quarantined copy stays rejected by Gatekeeper. Install
  # with `--no-quarantine` to launch it directly:
  #   brew install --cask --no-quarantine notchbar
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "NotchBar.app"

  uninstall quit: "com.periicles.NotchBar"

  # Sandboxed app: all its data lives in the container.
  zap trash: "~/Library/Containers/com.periicles.NotchBar"
end
