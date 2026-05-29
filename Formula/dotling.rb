class Dotling < Formula
  desc "Zero-dependency dotfiles management CLI"
  homepage "https://github.com/auricvex/dotling"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/auricvex/dotling/releases/download/v0.6.2/dotling-aarch64-macos.tar.gz"
      sha256 "77c10ea970fbc8f4af2232e71fc6da37bb1c6393ebefe21b2ae240f9db55aded"
    end
    if Hardware::CPU.intel?
      url "https://github.com/auricvex/dotling/releases/download/v0.6.2/dotling-x86_64-macos.tar.gz"
      sha256 "93052795467ccdc4b927c80dd5247d732c188668cb4ffd428632e41b38f972c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/auricvex/dotling/releases/download/v0.6.2/dotling-aarch64-linux.tar.gz"
      sha256 "968cd3ca487495ee4ce41785ac1b2b1e77b53e6fc230a72a8f80fe54f1260c44"
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/auricvex/dotling/releases/download/v0.6.2/dotling-x86_64-linux.tar.gz"
      sha256 "4a85c4ef3951b530b91e997e956170afd2129dd1b5d02dd1fd483b075cb0bd2f"
    end
  end

  def install
    bin.install "dotling"
  end

  test do
    assert_match "dotling #{version}", shell_output("#{bin}/dotling --version")
  end
end
