require 'rbconfig'

class Gotunl < Formula
  desc "Command line client for Pritunl"
  homepage "https://github.com/cghdev/gotunl"
  version "1.2.2"

  on_linux do
    url "https://github.com/cghdev/gotunl/releases/download/#{version}/gotunl-linux-amd64.zip"
    sha256 "c26a627c08027052617f4791d7c807bcb52672118ac21b1b5449367f63487905"
  end
  on_macos do
    url "https://github.com/cghdev/gotunl/releases/download/#{version}/gotunl-darwin-amd64.zip"
    sha256 "5fb3a0124f80c89ea7460df58180160866b96e28656d7f1d74531b45e06ea2ff"
  end

  def install
    bin.install "gotunl"
  end

  test do
    # gotunl -v exits with code 1 so we use cat to pass output but exiting 0
    assert_equal version, shell_output("gotunl -v | cat -").strip
    # gotunl -l exits with code 1 when there are no profiles, but as it is expected we use cat like above
    assert_equal "No profiles found in Pritunl", shell_output("gotunl -l | cat -").strip
  end
end
