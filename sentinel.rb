class Sentinel < Formula
  desc "Cross-platform file system watcher with real-time webhook notifications"
  homepage "https://github.com/icobani/Sentinel"
  version "1.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/icobani/Sentinel/releases/download/v1.0.5/sentinel-darwin-arm64.tar.gz"
      sha256 "83c007141994ff2f5fe9350cb247e23475a8d18d9a7bffc9978c45089296e512"
    else
      url "https://github.com/icobani/Sentinel/releases/download/v1.0.5/sentinel-darwin-amd64.tar.gz"
      sha256 "85e0460042fb60c8e869b4a9a0e1daa0220b307a32b7b7fcfaa607d3215535bc"
    end
  end

  on_linux do
    url "https://github.com/icobani/Sentinel/releases/download/v1.0.5/sentinel-linux-amd64.tar.gz"
    sha256 "39387ed02ebdad2c2e81f7962a1397b8918773409ea6cbb9154aa68440548e8a"
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
