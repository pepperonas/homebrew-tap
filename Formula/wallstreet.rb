class Wallstreet < Formula
  desc "Fill your console with Wall Street-like news and stats"
  homepage "https://wallstreet.celox.io"
  url "https://github.com/pepperonas/wallstreet/releases/download/v1.1.0/wallstreet.tar.gz"
  version "1.1.0"
  sha256 "37dcf4f9726b1c5b4c9c8902c09fef082078ae2b55f2bc42e44c421c9ab2e02d"
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
