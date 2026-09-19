class Crestore < Formula
  desc "Snapshot running Claude Code sessions and restore them in Ghostty, two per window"
  homepage "https://github.com/akgandlur/crestore"
  url "https://github.com/akgandlur/crestore/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ad068c29704afbe5a3ab26979f81680c167cc7fdadcaa18fad9e9279933c2231"
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
