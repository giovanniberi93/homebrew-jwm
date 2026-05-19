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

  depends_on macos: ">= :sonoma"

  app "jwm.app", target: "jWM.app"

  uninstall quit: "com.giovanniberi93.jwm"

  zap trash: [
    "~/Library/Application Support/com.giovanniberi93.jwm",
    "~/Library/Caches/com.giovanniberi93.jwm",
    "~/Library/HTTPStorages/com.giovanniberi93.jwm",
    "~/Library/Preferences/com.giovanniberi93.jwm.plist",
  ]

  caveats <<~EOS
    jwm is distributed unsigned. On first launch macOS will block it.
    Either right-click jWM in Applications and choose Open, or run:
      xattr -dr com.apple.quarantine /Applications/jWM.app

    jwm needs Accessibility permission. Grant it in:
      System Settings → Privacy & Security → Accessibility
  EOS
end
