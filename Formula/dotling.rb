class Dotling < Formula
  desc "Zero-dependency dotfiles management CLI"
  homepage "https://github.com/auricvex/dotling"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/auricvex/dotling/releases/download/v0.8.0/dotling-aarch64-macos.tar.gz"
      sha256 "60531c98894a4e750dad3a0d4db05ed80fbeafff5d871bdb95b2adc2a904f6f6"
    end
    if Hardware::CPU.intel?
      url "https://github.com/auricvex/dotling/releases/download/v0.8.0/dotling-x86_64-macos.tar.gz"
      sha256 "6e34a62b4af69e4eac4353a7f2b83692064a08b1cc048a9bd2055ca36cf054fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/auricvex/dotling/releases/download/v0.8.0/dotling-aarch64-linux.tar.gz"
      sha256 "9d9bc55138721c5dfc42b1f5dd7dd692ae018ce1524d6664d56aa171663c261a"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/auricvex/dotling/releases/download/v0.8.0/dotling-x86_64-linux.tar.gz"
      sha256 "274ed6f353c0991bb92761ad23568ca5e242c339dbfeee44af2ce1ddc559e762"
    end
  end

  def install
    bin.install "dotling"
  end

  test do
    assert_match "dotling #{version}", shell_output("#{bin}/dotling --version")
  end
end
