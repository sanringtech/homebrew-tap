cask "haul" do
  version "0.1.0"
  sha256 "bafc418b47064af48b1b2edd1dfd246b930321fae7e68729c46fd3baa133f220"

  # Hardcoded "-arm64" rather than an `arch` stanza — there's only ever been one variant built
  # so far (see depends_on below), no x64 counterpart to branch on yet.
  url "https://github.com/sanringtech/haul/releases/download/v#{version}/SanringHaul-#{version}-macOS-arm64.dmg"
  name "sanring Haul"
  desc "Track Claude, Codex, DeepSeek, Kimi, and Grok usage in one place"
  homepage "https://haul.sanring.dev"

  # Apple Silicon only for now — no osx-x64 build has been cut yet (see the main repo's
  # RELEASE-PLAN.md). depends_on arch: :arm64 makes `brew install --cask haul` refuse cleanly
  # on Intel Macs instead of silently trying to run an arm64 binary.
  depends_on arch: :arm64

  app "SanringHaul.app"

  # Unsigned, unnotarized build (see RISKS.md on the main repo). Checked by hand after a real
  # `brew install --cask haul` (2026-09-01): the installed .app still carries com.apple.quarantine
  # — this Homebrew version does NOT strip it for casks, so Gatekeeper still blocks a Finder
  # double-click same as a manually-downloaded .dmg would. Don't repeat the "brew handles this
  # for you" assumption without re-verifying against whatever brew version is current then.
  caveats do
    <<~EOS
      sanring Haul is not code-signed or notarized yet (v0.1.0, small-scale sharing stage).
      Gatekeeper will still block the first launch — right-click the app in Finder and choose
      "Open", or run: xattr -d com.apple.quarantine /Applications/SanringHaul.app
      Full risk disclosure: https://github.com/sanringtech/haul/blob/main/RISKS.md
    EOS
  end

  zap trash: [
    "~/Library/Application Support/SanRingUsageMonitor",
  ]
end
