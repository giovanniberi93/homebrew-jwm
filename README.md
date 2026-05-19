# homebrew-jwm

Homebrew tap for [jwm](https://github.com/giovanniberi93/jWM) — a macOS tiling window manager that combines app focusing and window tiling into a single key-chord interaction.

## Install

```bash
brew install --cask giovanniberi93/jwm/jwm
```

That's a shortcut for:

```bash
brew tap giovanniberi93/jwm
brew install --cask jwm
```

## First launch — Gatekeeper

jwm is distributed unsigned (no $99/yr Apple Developer Program). On first launch, macOS will refuse to open it.

Either:

- right-click `jWM` in `/Applications` and choose **Open**, then confirm; or
- remove the quarantine attribute:

  ```bash
  xattr -dr com.apple.quarantine /Applications/jWM.app
  ```

After launch, grant Accessibility permission when prompted: **System Settings → Privacy & Security → Accessibility**.

## Supported macOS versions

Sonoma (14), Sequoia (15), and Tahoe (26).

## Upgrade / uninstall

```bash
brew upgrade --cask jwm
brew uninstall --cask --zap jwm   # --zap also removes preferences
```

## Source

Source code and issues: https://github.com/giovanniberi93/jWM
