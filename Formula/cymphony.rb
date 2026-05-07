class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.4.1/cymphony_macos_arm"
      sha256 "03817ea53076277d8f1388868ed756306f8a7db6eed17bd4c0155cfceff9538d"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.4.1/cymphony_macos_intel"
      sha256 "41c9a3b0ffe35855505eac322df14fe5f4c728c163f5918d7cf3d1620bb7db5f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.4.1/cymphony_linux"
      sha256 "b4af1dd3078245c57d05306647ae288d25f865e8582af1f3ca489b5e4eb0b596"
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
