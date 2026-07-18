class Figo < Formula
  desc "ASCII and Unicode art CLI for diagrams, tables, and banners"
  homepage "https://github.com/auricvex/figo"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/auricvex/figo/releases/download/v0.2.0/figo-aarch64-apple-darwin.tar.gz"
      sha256 "dd0f22928ccccce478fe48e4f37db2c9e8f53e243c5370d737582099efca043d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/auricvex/figo/releases/download/v0.2.0/figo-x86_64-apple-darwin.tar.gz"
      sha256 "704a0bad2d9d533df4aa66679ec393c6347456133f4be8cfb99cddb5120d7e0f"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/auricvex/figo/releases/download/v0.2.0/figo-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cfbd9668df6e9aac73cf71308e37165bf227542a992c96fb2fe7cb2ae3a0f912"
    end
  end

  def install
    bin.install "figo"
  end

  test do
    assert_match "figo #{version}", shell_output("#{bin}/figo --version")
  end
end
