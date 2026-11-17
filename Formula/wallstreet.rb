class Wallstreet < Formula
  desc "Fill your console with Wall Street-like news and stats"
  homepage "https://wallstreet.celox.io"
  url "https://github.com/pepperonas/wallstreet/releases/download/v1.5.0/wallstreet.tar.gz"
  version "1.5.0"
  sha256 "c52dbf8782bc1a2ddbde5961dad56dd17a8c9400f22c843bc3da662eab4b5963"
  license "Apache-2.0"

  depends_on "jp2a"
  depends_on "libcaca"
  depends_on "newsboat"
  depends_on "tmux"
  uses_from_macos "python"

  def install
    bin.install "bin/wallstreet"
    (lib/"wallstreet").install Dir["lib/wallstreet/*"]
    (share/"wallstreet").install Dir["share/wallstreet/*"]
    man1.install "share/man/man1/wallstreet.1"
  end

  test do
    assert_match "wallstreet #{version}", shell_output("#{bin}/wallstreet --version")
    ENV["WALLSTREET_DEMO"] = "1"
    assert_match "MOST ACTIVE", shell_output("#{share}/wallstreet/wsdata table")
  end
end
