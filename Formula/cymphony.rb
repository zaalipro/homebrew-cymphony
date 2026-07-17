class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.1.0/cymphony_macos_arm"
      sha256 "78734595cf1b8d8fbcaae68ea647f73f815e07b9cb98bb052c03cacca25fbcb4"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.1.0/cymphony_macos_intel"
      sha256 "953ac55cfa4a9d64357f0c23c794973f926f3a809d69508e2b9e7d9805166c78"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.1.0/cymphony_linux"
      sha256 "acc8340ac3b3c966545eb5ccd6e53213b307a092173cfb36b289bc9cee8a6f06"
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
