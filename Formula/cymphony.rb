class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.4/cymphony_macos_arm"
      sha256 "5d4a6773cb970bbc6dc3d29811e0800c43bfdebcbee190d3591b675f1eaf8e3c"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.4/cymphony_macos_intel"
      sha256 "fe6fb495b4802c23887a367f5a70ee50c45f3e0436b6ff6cdb03fe4159dc3e4a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.4/cymphony_linux"
      sha256 "0d7473aa4377e657f9347e31904f3973da12a457dd5ebb92f0d9690667912ec7"
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
