cask "karakept" do
  version "2.4.1"
  sha256 "92374ec361a42b80bbe676b8e475f0a86f2344baf1b59b20f64e1d865de4e302"

  url "https://github.com/lmgarret/karakept-kmp/releases/download/v#{version}/Karakept-#{version}.dmg"
  name "Karakept"
  desc "Offline-first client for the Karakeep bookmark manager"
  homepage "https://github.com/lmgarret/karakept-kmp"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

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
