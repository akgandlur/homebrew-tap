class Crestore < Formula
  desc "Snapshot running Claude Code sessions and restore them in Ghostty"
  homepage "https://github.com/akgandlur/crestore"
  url "https://github.com/akgandlur/crestore/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "d44cd9fabee15d3165c464cd2cafdeaca9dc932b66ecb561ca392080ca4745ee"
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
