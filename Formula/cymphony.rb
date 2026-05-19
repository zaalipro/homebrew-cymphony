class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.6.0/cymphony_macos_arm"
      sha256 "9a801fc522aed8cf44b0a37b03c26a9f1a9e4c8ec603ac86d0a57b8179dcbb94"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.6.0/cymphony_macos_intel"
      sha256 "8f604cbbd8c63f11231f68ddef58479aeda0b282eff33d8ce614018ead239a97"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.6.0/cymphony_linux"
      sha256 "aa458be45a5f35cb153142c8537efdc4a246b2612cad73b4368477c057afa0e7"
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
