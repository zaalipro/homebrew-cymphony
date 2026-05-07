class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.3/cymphony_macos_arm"
      sha256 "18fd9860566662272eff5e30a196db6fdfda2e28bb9af193782ea7cc54d27de0"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.3/cymphony_macos_intel"
      sha256 "09cd33ba50f10826e68450e92dcfc50086ce80a680d2934f1f2b80f58d1d2475"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.3/cymphony_linux"
      sha256 "4806f87f29a8ab1197c71b5e90f6aa3cb0ab7890165a7723bf0ac698942e6954"
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
