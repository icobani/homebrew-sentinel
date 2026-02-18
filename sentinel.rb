class Sentinel < Formula
  desc "Cross-platform file system watcher with real-time webhook notifications"
  homepage "https://github.com/icobani/Sentinel"
  version "1.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/icobani/Sentinel/releases/download/v1.0.4/sentinel-darwin-arm64.tar.gz"
      sha256 "0cc195b1cc33d59ec24466ab28e362b8f23d664c833ec6fe300de7fad920313b"
    else
      url "https://github.com/icobani/Sentinel/releases/download/v1.0.4/sentinel-darwin-amd64.tar.gz"
      sha256 "81faea4f6d7973c4afff4e33bc58bacd8527c4997dcf1e1113003e11adadd193"
    end
  end

  on_linux do
    url "https://github.com/icobani/Sentinel/releases/download/v1.0.4/sentinel-linux-amd64.tar.gz"
    sha256 "d61ace5205ed187de13b4347e636b65efc6f8dda42cdb93d47d081d0349cbd71"
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
