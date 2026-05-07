class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.4.2/cymphony_macos_arm"
      sha256 "c1ad8641f1c5a3fd63d47220a000f919f9fa1741d0822db1a8f57020756f442e"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.4.2/cymphony_macos_intel"
      sha256 "3eb5bccfffead5a3d9127d403208899c6d9e6d7bc387ec018f84d4728baf6d78"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.4.2/cymphony_linux"
      sha256 "fb33c4b4026516bb726534f59ad70b9b30ec3d77118d641b98ee944b0bac623e"
    end
  end

  conflicts_with "cymphony-lite", because: "both install bin/cymphony"

  def install
    binary = Dir["cymphony*"].find { |f| File.file?(f) }
    odie "cymphony binary not found in archive" unless binary
    bin.install binary => "cymphony"
  end

  test do
    assert_match "cymphony", shell_output("#{bin}/cymphony 2>&1", 1)
  end
end
