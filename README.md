# Periicles Homebrew Tap

Homebrew casks for [Periicles](https://github.com/Periicles)' apps.

## NotchBar

[NotchBar](https://github.com/Periicles/Notchapp) shows the current calendar
event's progress in the MacBook notch.

```sh
brew install --cask --no-quarantine periicles/tap/notchbar
```

> **Why `--no-quarantine`?** NotchBar is ad-hoc signed and not yet Apple-notarized.
> Without the flag, Gatekeeper quarantines the download and blocks first launch
> (you'd have to allow it in *System Settings → Privacy & Security → Open Anyway*).
> `--no-quarantine` skips that. The flag goes away once notarization ships.

Update it with `brew upgrade --cask notchbar`, remove it with
`brew uninstall --cask notchbar` (add `--zap` to also drop its preferences).
