class Dotling < Formula
  desc "Zero-dependency dotfiles management CLI"
  homepage "https://github.com/auricvex/dotling"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/auricvex/dotling/releases/download/v0.9.0/dotling-aarch64-macos.tar.gz"
      sha256 "999fb027799f668c87634a0061e8093ecc2ff661dfbdcc4e4747831fe450a962"
    end
    if Hardware::CPU.intel?
      url "https://github.com/auricvex/dotling/releases/download/v0.9.0/dotling-x86_64-macos.tar.gz"
      sha256 "ff6a246ac888b3e6206cf4cc19650e2e51cacf9fd764d1356c55c2f393e5f615"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/auricvex/dotling/releases/download/v0.9.0/dotling-aarch64-linux.tar.gz"
      sha256 "c07c1de2a15c165e25e3577f25659034ec3fe380fe37269d8c16d425d5579db5"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/auricvex/dotling/releases/download/v0.9.0/dotling-x86_64-linux.tar.gz"
      sha256 "e818f279716a793f10096a3cc92c274b97b8cecea29725cb7f739acd2eadcbdc"
    end
  end

  def install
    bin.install "dotling"
  end

  test do
    assert_match "dotling #{version}", shell_output("#{bin}/dotling --version")
  end
end
