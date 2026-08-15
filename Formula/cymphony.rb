class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.3.1/cymphony_macos_arm"
      sha256 "4e948fa4bcdfb27bee375545edb4d0c604e4f121aa53e64ac1caee6685e35ac7"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.3.1/cymphony_macos_intel"
      sha256 "aa969172d613483ece5de94b173fe737690803511958dd309786dc950607692a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.3.1/cymphony_linux"
      sha256 "c5a203ffcd7baa3b44878b3f8a1ebf74b05fe2b53908f8ecb94e42aab453b14c"
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
