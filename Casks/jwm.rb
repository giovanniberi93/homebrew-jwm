cask "jwm" do
  version "0.1"
  sha256 "b2fcbd523fcfe85fc47d9cf990595b286bc4d4f76948c484a1d043a2534b97d8"

  url "https://github.com/giovanniberi93/jWM/releases/download/v#{version}/jWM-#{version}.zip"
  name "jWM"
  desc "Tiling window manager with chord-based focus and tiling"
  homepage "https://github.com/giovanniberi93/jWM"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "jwm.app", target: "jWM.app"

  uninstall quit: "com.giovanniberi93.jwm"

  zap trash:  [
        "~/Library/Application Support/jwm",
        "~/Library/Caches/com.giovanniberi93.jwm",
        "~/Library/HTTPStorages/com.giovanniberi93.jwm",
        "~/Library/Preferences/com.giovanniberi93.jwm.plist",
      ],
      script: {
        executable: "/bin/sh",
        args:       ["-c", "defaults delete com.giovanniberi93.jwm 2>/dev/null; killall cfprefsd 2>/dev/null; true"],
        sudo:       false,
      }

  caveats <<~EOS
    jwm is distributed unsigned. On first launch macOS will block it. Either:

      * open System Settings → Privacy & Security, scroll to the
        "jWM was blocked" notice, and click "Open Anyway"; or
      * remove the quarantine attribute manually:
          xattr -dr com.apple.quarantine /Applications/jWM.app

    jwm needs Accessibility permission. Grant it in:
      System Settings → Privacy & Security → Accessibility
  EOS
end
