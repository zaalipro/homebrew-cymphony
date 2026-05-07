class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.0/cymphony_macos_arm"
      sha256 "577f4a115910ce5309d823d17e7e0dbaae55e56b0f5778f9ceef7327d159ac63"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.0/cymphony_macos_intel"
      sha256 "5ccb6213085afb24b5b3e0071b6993bdad480254aa84915b5c40e55f41d0eb67"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.0/cymphony_linux"
      sha256 "c532004a432b0eddb907597fef0f503107d6c57c99368cee75720c90a1209a75"
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
