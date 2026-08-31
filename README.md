# Periicles Homebrew Tap

Homebrew casks for [Periicles](https://github.com/Periicles)' apps.

## NotchBar

[NotchBar](https://github.com/Periicles/Notchapp) shows the current calendar
event's progress in the MacBook notch.

```sh
brew tap periicles/tap
brew trust periicles/tap          # Homebrew 6+ needs an explicit trust for third-party casks
brew install --cask notchbar
xattr -dr com.apple.quarantine /Applications/NotchBar.app
```

> **Why the last line?** NotchBar is ad-hoc signed, and Apple notarization is not
> planned, so macOS refuses to open it while it carries the quarantine flag
> Homebrew attaches. Clearing the flag is what lets it launch; without it you'd
> have to allow the app in *System Settings → Privacy & Security → Open Anyway*.
> `--no-quarantine` used to do this and was removed in Homebrew 6 — casks can no
> longer opt out.

Update it with `brew upgrade --cask notchbar`, then run the `xattr` line again:
an upgrade re-quarantines the app, because Homebrew carries an unquarantined app
forward only while its signing identity is unchanged, and an ad-hoc signature is
designated by a `cdhash` that every build changes.

Remove it with `brew uninstall --cask notchbar` (add `--zap` to also delete its
data, which lives in the app's sandbox container).
