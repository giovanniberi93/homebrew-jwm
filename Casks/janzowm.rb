cask "janzowm" do
  version "0.3"
  sha256 "09caeb48c1128d98ae4487ae5f7146e5b0480a359373b8997eec69fec17557ae"

  url "https://github.com/giovanniberi93/janzoWM/releases/download/v#{version}/janzoWM-#{version}.zip"
  name "janzoWM"
  desc "Tiling window manager with chord-based focus and tiling"
  homepage "https://github.com/giovanniberi93/janzoWM"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "janzowm.app", target: "janzoWM.app"

  uninstall quit: "com.giovanniberi93.janzowm"

  zap trash:  [
        "~/Library/Application Support/janzowm",
        "~/Library/Caches/com.giovanniberi93.janzowm",
        "~/Library/HTTPStorages/com.giovanniberi93.janzowm",
        "~/Library/Preferences/com.giovanniberi93.janzowm.plist",
      ],
      script: {
        executable: "/bin/sh",
        args:       ["-c", "defaults delete com.giovanniberi93.janzowm 2>/dev/null; killall cfprefsd 2>/dev/null; true"],
        sudo:       false,
      }

  caveats <<~EOS
    janzowm is distributed unsigned. On first launch macOS will block it. Either:

      * open System Settings → Privacy & Security, scroll to the
        "janzoWM was blocked" notice, and click "Open Anyway"; or
      * remove the quarantine attribute manually:
          xattr -dr com.apple.quarantine /Applications/janzoWM.app

    janzowm needs Accessibility permission. Grant it in:
      System Settings → Privacy & Security → Accessibility
  EOS
end
