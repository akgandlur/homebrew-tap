class Crestore < Formula
  desc "Snapshot running Claude Code sessions and restore them in Ghostty"
  homepage "https://github.com/akgandlur/crestore"
  url "https://github.com/akgandlur/crestore/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3f604ff76646d1298d491359ab43a1198ab67b87b4e20f9071d17c28b1575a4e"
  license "MIT"

  depends_on "jq"
  depends_on :macos

  def install
    bin.install "crestore"
  end

  def caveats
    <<~EOS
      New Ghostty panes pick up restored sessions through a zsh hook. Install it once:
        crestore install
      Restoring sends keystrokes to Ghostty, so grant Ghostty Accessibility access in
      System Settings -> Privacy & Security -> Accessibility.
    EOS
  end

  test do
    assert_match "crestore", shell_output("#{bin}/crestore help")
  end
end
