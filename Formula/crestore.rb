class Crestore < Formula
  desc "Snapshot running Claude Code sessions and restore them in Ghostty"
  homepage "https://github.com/akgandlur/crestore"
  url "https://github.com/akgandlur/crestore/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "c84d755323923d54938febf36d989f88ddfe2281aacf856078f424ced080331d"
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
