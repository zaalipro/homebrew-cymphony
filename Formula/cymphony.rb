class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.3.0/cymphony_macos_arm"
      sha256 "2e5788663101786b78927b14c4b370ab2932db90e6aac84f70f1a51748eee77a"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.3.0/cymphony_macos_intel"
      sha256 "5d91562abe287a0ea012bd3b16cb63a9e1676789a3f9ac8f9e56615623868acb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.3.0/cymphony_linux"
      sha256 "376aa260b7e8534e0fd0e7c0862b287e2e78a266a31b8affc7617b9a9ffbec9c"
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
