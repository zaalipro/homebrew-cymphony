class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.0.2/cymphony_macos_arm"
      sha256 "b4422d5f83b378519f565d3e852edc16842f7b38302ae257de304e78270d78c2"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.0.2/cymphony_macos_intel"
      sha256 "13c2b8a32e265e33e5e0e10cf715214e647af5e91bcb0767b3eac840d09d30b5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v2.0.2/cymphony_linux"
      sha256 "9db7b9b39870e09c2cd04f497fc7f7ec734e06ef54bde583ba761657b091083b"
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
