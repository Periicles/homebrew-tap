cask "notchbar" do
  version "0.3.3"
  sha256 "277b2cfe8b8ffb746c23c752936da7323cfebfced48d4173892dc7f69ff00838"

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

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "NotchBar.app"

  uninstall quit: "com.periicles.NotchBar"

  # Sandboxed app: all its data lives in the container.
  zap trash: "~/Library/Containers/com.periicles.NotchBar"

  # Homebrew 6 removed `--no-quarantine` and quarantines every cask, which an
  # ad-hoc signature cannot pass. The flag comes back on each upgrade too: an
  # unquarantined app is only carried forward while its signing identity holds,
  # and an ad-hoc one is designated by a cdhash that every build changes.
  caveats do
    <<~EOS
      NotchBar is ad-hoc signed, not notarized by Apple, so macOS refuses to open
      it while it carries the quarantine flag Homebrew sets. Clear the flag:

        xattr -dr com.apple.quarantine #{appdir}/NotchBar.app

      Run that again after every `brew upgrade --cask notchbar`.
    EOS
  end
end
