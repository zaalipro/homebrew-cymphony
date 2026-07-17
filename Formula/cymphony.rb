class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.0.0/cymphony_macos_arm"
      sha256 "45a7382ec0d440ea87b9e638846498c4ec71428d6fa3f8cf8b605db863a70ab4"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.0.0/cymphony_macos_intel"
      sha256 "bcb9768ded10ef0555d478b56ced63de77152f6173d4526c967ae69a91225863"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.0.0/cymphony_linux"
      sha256 "3b9e608c8a1b9594757c24d3b4a274c9f6b52fb64428def429ec3b65147127c5"
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
