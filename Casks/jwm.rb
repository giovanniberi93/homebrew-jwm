cask "jwm" do
  version :latest
  sha256 :no_check

  url "https://github.com/giovanniberi93/janzoWM"
  name "janzoWM"
  homepage "https://github.com/giovanniberi93/janzoWM"

  disable! date: "2026-05-21", because: "renamed to janzowm — install with: brew install --cask giovanniberi93/janzowm/janzowm"
end
