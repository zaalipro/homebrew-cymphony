class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.4.0/cymphony_macos_arm"
      sha256 "a52b72b57453c6d2e3d991ee8755b6b6bc39a3f4cca36d26b31a0f1b5a50b018"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.4.0/cymphony_macos_intel"
      sha256 "539c82465f6864ac38befaea2086845bd3234263f64fbb731535fa9004f6742c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.4.0/cymphony_linux"
      sha256 "176cad9b8b1c18000802880deaf0715ef9be72803e53e6da6fc4971fcba6e202"
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
