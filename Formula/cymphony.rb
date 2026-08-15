class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.3.0/cymphony_macos_arm"
      sha256 "4d776b0c0142e9186a0623acf1f1108405f9339b2d83cd458a5bcb1e0d66623a"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.3.0/cymphony_macos_intel"
      sha256 "624b8adb8d355301c9d8264232b981753545cf0bbf8cc4ddb109bc2ecc701ace"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.3.0/cymphony_linux"
      sha256 "ff718806b6a489fa6e208d065f90c492027d588c1bfeb7f972b102c29869cfce"
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
