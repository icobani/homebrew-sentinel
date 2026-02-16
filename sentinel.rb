class Sentinel < Formula
  desc "Cross-platform file system watcher with real-time webhook notifications"
  homepage "https://github.com/icobani/Sentinel"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/icobani/Sentinel/releases/download/v1.0.1/sentinel-darwin-arm64.tar.gz"
      sha256 "ec3dd30679de40c545d1b48967807282b1168f133f7036a8bdf800ecd452755a"
    else
      url "https://github.com/icobani/Sentinel/releases/download/v1.0.1/sentinel-darwin-amd64.tar.gz"
      sha256 "75881f9c1a4905be82d833d0e2f3dbbaf0361cc6d5207531f78a990853aeebdd"
    end
  end

  on_linux do
    url "https://github.com/icobani/Sentinel/releases/download/v1.0.1/sentinel-linux-amd64.tar.gz"
    sha256 "4135b2546ff2e45f14b39eeb2227dbb40ded791399ae0aedc120c3ba130e4306"
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
