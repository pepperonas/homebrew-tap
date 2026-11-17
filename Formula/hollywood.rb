class Hollywood < Formula
  desc "Fill your console with Hollywood melodrama technobabble"
  homepage "https://hollywood.celox.io"
  url "https://github.com/pepperonas/hollywood/releases/download/v1.3.0/hollywood.tar.gz"
  version "1.3.0"
  sha256 "433c86711a35d8ea2626454f55fb70653b92cf1e63437c86835f855f163570a8"
  license "Apache-2.0"

  depends_on "bat"
  depends_on "bmon"
  depends_on "cmatrix"
  depends_on "figlet"
  depends_on "htop"
  depends_on "jp2a"
  depends_on "moreutils"
  depends_on "mplayer"
  depends_on "pv"
  depends_on "pygments"
  depends_on "tmux"
  depends_on "tree"

  def install
    bin.install "bin/hollywood"
    (lib/"hollywood").install Dir["lib/hollywood/*"]
    (share/"hollywood").install Dir["share/hollywood/*"]
    man1.install "share/man/man1/hollywood.1"
  end

  test do
    assert_match "hollywood #{version}", shell_output("#{bin}/hollywood --version")
    assert_match(/^\w+ \(/, shell_output("#{share}/hollywood/shims/apg"))
  end
end
