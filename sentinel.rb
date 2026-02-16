class Sentinel < Formula
  desc "Cross-platform file system watcher with real-time webhook notifications"
  homepage "https://github.com/icobani/Sentinel"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/icobani/Sentinel/releases/download/v1.0.2/sentinel-darwin-arm64.tar.gz"
      sha256 "009daa89bef607f5d4d2b26718c32b03c88fce42a1537d5e990f21833655f06c"
    else
      url "https://github.com/icobani/Sentinel/releases/download/v1.0.2/sentinel-darwin-amd64.tar.gz"
      sha256 "2f0597207307e9ed85a2a203b246bacb19ecd71e5cda204000f3ce4702669568"
    end
  end

  on_linux do
    url "https://github.com/icobani/Sentinel/releases/download/v1.0.2/sentinel-linux-amd64.tar.gz"
    sha256 "828140c5a59bc6d83da88bc5e5e0df6b7adf32f454a05e7436fd516809c0dd03"
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
