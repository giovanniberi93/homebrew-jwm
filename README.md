# homebrew-janzowm

Homebrew tap for [janzoWM](https://github.com/giovanniberi93/janzoWM) — a macOS tiling window manager that combines app focusing and window tiling into a single key-chord interaction. Vim-like keybindings supported.

## Install

```bash
brew install --cask giovanniberi93/janzowm/janzowm
```

That's a shortcut for:

```bash
brew tap giovanniberi93/janzowm
brew install --cask janzowm
```

## First launch — Gatekeeper

janzoWM is distributed unsigned (no $99/yr Apple Developer Program). On first launch, macOS will refuse to open it.

Two ways past it:

- **System Settings → Privacy & Security**, scroll to the "*janzoWM* was blocked..." notice and click **Open Anyway**, then confirm; or
- remove the quarantine attribute from the bundle:

  ```bash
  xattr -dr com.apple.quarantine /Applications/janzoWM.app
  ```

After launch, grant Accessibility permission when prompted: **System Settings → Privacy & Security → Accessibility**.

## Supported macOS versions

Sonoma (14), Sequoia (15), and Tahoe (26).

## Upgrade / uninstall

```bash
brew upgrade --cask janzowm
brew uninstall --cask --zap janzowm   # --zap also removes preferences
```

## Source

Source code and issues: https://github.com/giovanniberi93/janzoWM
