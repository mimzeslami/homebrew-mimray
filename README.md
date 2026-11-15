# Homebrew tap for mimray

[mimray](https://github.com/mimzeslami/mimray) is a simple, secure V2Ray-compatible VPN client (sing-box core).

```sh
brew tap mimzeslami/mimray
brew trust mimzeslami/mimray     # Homebrew 7+ asks you to trust third-party taps once
brew install --cask mimray
```

Update with `brew upgrade --cask mimray` (the app also updates itself). Uninstall with `brew uninstall --cask mimray`
(`--zap` also removes your servers and settings).
