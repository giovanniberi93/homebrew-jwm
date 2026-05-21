cask "jwm" do
  version :latest
  sha256 :no_check

  url "https://github.com/giovanniberi93/janzoWM"
  name "janzoWM"
  homepage "https://github.com/giovanniberi93/janzoWM"

  disable! date: "2026-05-21", because: <<~REASON.strip
    renamed to janzowm. Migrate with:
      brew uninstall --cask jwm
      brew untap giovanniberi93/jwm
      brew install --cask giovanniberi93/janzowm/janzowm
  REASON
end
