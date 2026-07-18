class Figo < Formula
  desc "ASCII and Unicode art CLI for diagrams, tables, and banners"
  homepage "https://github.com/auricvex/figo"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/auricvex/figo/releases/download/v0.1.0/figo-aarch64-apple-darwin.tar.gz"
      sha256 "ce81d121827a645fb663f2088cc0068a797c679b29015f168471f7c3c18cf711"
    end
    if Hardware::CPU.intel?
      url "https://github.com/auricvex/figo/releases/download/v0.1.0/figo-x86_64-apple-darwin.tar.gz"
      sha256 "91bd9150fb6415e9b6b081919adec2d85a8297a7c7d59af5c1a6b9903e3e4cc5"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/auricvex/figo/releases/download/v0.1.0/figo-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd49998a72d76b3c06a6f7518a015117e27286f0f5167b71c16c8198afcc6e9b"
    end
  end

  def install
    bin.install "figo"
  end

  test do
    assert_match "figo #{version}", shell_output("#{bin}/figo --version")
  end
end
