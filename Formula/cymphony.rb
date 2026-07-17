class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.2.0/cymphony_macos_arm"
      sha256 "36cced233a09644974fe85f9a4c5a5d751a53cefe5f47e2ea864981d0e42a112"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.2.0/cymphony_macos_intel"
      sha256 "6ebdefc1ffca732e268060841dddcee14d51abd18bfd71d734ba4aca3ea46214"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.2.0/cymphony_linux"
      sha256 "462a0474da597c6767ebb6bd5ef49f5d7ec5a91456bbe785d5e03ec26aea36b2"
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
