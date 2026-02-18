class Sentinel < Formula
  desc "Cross-platform file system watcher with real-time webhook notifications"
  homepage "https://github.com/icobani/Sentinel"
  version "1.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/icobani/Sentinel/releases/download/v1.0.3/sentinel-darwin-arm64.tar.gz"
      sha256 "1819aeaaaadfa3a1def1fa30b624ec737d1a64ebe70142a32e4b9e074df26752"
    else
      url "https://github.com/icobani/Sentinel/releases/download/v1.0.3/sentinel-darwin-amd64.tar.gz"
      sha256 "b482e901805f3ca7b2334b9426de7398799c29a55751338c86cd6cb252e35959"
    end
  end

  on_linux do
    url "https://github.com/icobani/Sentinel/releases/download/v1.0.3/sentinel-linux-amd64.tar.gz"
    sha256 "7bb84991c71d7f2656afbe0e3f9f629c9533cbe8321bdb378431cf8ad9ad2819"
  end

  def install
    bin.install "sentinel"
  end

  service do
    run [opt_bin/"sentinel"]
    working_dir etc
    keep_alive true
    log_path var/"log/sentinel.log"
    error_log_path var/"log/sentinel.log"
  end

  test do
    assert_match "sentinel", shell_output("#{bin}/sentinel version 2>&1", 0)
  end
end
