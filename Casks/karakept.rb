cask "karakept" do
  version "2.6.0"
  sha256 "62dfcdee73b03ceb46c46b0e2fa94c27f6020beac7808f9fe731529e42877924"

  url "https://github.com/lmgarret/karakept-kmp/releases/download/v#{version}/Karakept-#{version}.dmg"
  name "Karakept"
  desc "Offline-first client for the Karakeep bookmark manager"
  homepage "https://github.com/lmgarret/karakept-kmp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Karakept.app"

  zap trash: [
    "~/.karakept",
    "~/Library/Saved Application State/com.karakept.app.savedState",
  ]

  caveats <<~EOS
    Karakept is not notarized by Apple, so macOS blocks the first launch.
    Allow it once in System Settings → Privacy & Security → "Open Anyway".
  EOS
end
