class Dotling < Formula
  desc "Zero-dependency dotfiles management CLI"
  homepage "https://github.com/auricvex/dotling"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/auricvex/dotling/releases/download/v0.7.0/dotling-aarch64-macos.tar.gz"
      sha256 "bec732dd68b6a0ebd3e0a303b1ddf8a7984824788a54ece0e3a85e85825d0c64"
    end
    if Hardware::CPU.intel?
      url "https://github.com/auricvex/dotling/releases/download/v0.7.0/dotling-x86_64-macos.tar.gz"
      sha256 "c1c7592d0fed4508e00e97c84ffb18cf7103c7b7a8df33967fbbc6b754961b50"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/auricvex/dotling/releases/download/v0.7.0/dotling-aarch64-linux.tar.gz"
      sha256 "92384a96b0f4e4a9e6e76a709f474f48a4b25e0b76b760bc3e5abcb7737280d7"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/auricvex/dotling/releases/download/v0.7.0/dotling-x86_64-linux.tar.gz"
      sha256 "d157913afec404ab6b255de3b0af1a864d44f1b6932d2092ce9fec9db844d073"
    end
  end

  def install
    bin.install "dotling"
  end

  test do
    assert_match "dotling #{version}", shell_output("#{bin}/dotling --version")
  end
end
