cask "karakept" do
  version "2.5.0"
  sha256 "a8d227802d492de3ecdd8105ecccf6baf474898c212ad181306fd581a2de78fd"

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
