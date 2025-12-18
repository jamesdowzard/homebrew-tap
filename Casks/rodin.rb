cask "rodin" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.0"
  sha256 arm:   "PLACEHOLDER_ARM64_SHA256",
         intel: "PLACEHOLDER_X86_64_SHA256"

  url "https://github.com/jamesdowzard/rodin/releases/download/v#{version}/Rodin-#{version}-#{arch}.zip"
  name "Rodin"
  desc "Local voice dictation powered by Whisper - open source alternative to Wispr Flow"
  homepage "https://github.com/jamesdowzard/rodin"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "Rodin.app"

  zap trash: [
    "~/Library/Application Support/Rodin",
    "~/Library/Caches/Rodin",
    "~/Library/Preferences/com.jamesdowzard.rodin.plist",
  ]

  caveats <<~EOS
    Rodin requires microphone access for voice dictation.
    Grant permission in System Settings > Privacy & Security > Microphone.

    Default hotkey: Cmd+Shift+Space (hold to record, release to transcribe)

    For offline transcription, download a Whisper model first:
      rodin --download-model small
  EOS
end
