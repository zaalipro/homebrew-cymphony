class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.0.1/cymphony_macos_arm"
      sha256 "09a05687e8696a0bf99ef06bfde6d9c1a7599ae54788edf1968dec5edc91ad8e"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.0.1/cymphony_macos_intel"
      sha256 "ce45295cbfb9453d90d8bbd2ba8e7fa02e68fd7c04e61ae97d14548f6c53f69b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.0.1/cymphony_linux"
      sha256 "4b0817e3af2abce40e289cf2e00bc49d69929d80f4a3e95fe92c907fc46778a2"
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
