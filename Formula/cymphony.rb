class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.1/cymphony_macos_arm"
      sha256 "4e93dc16770b57542453a4a3f97c5c92908848b3cbee13379ed3d9bf7f3ed702"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.1/cymphony_macos_intel"
      sha256 "40bf981802f7db27e41ec8a8db48ddc7109e96bbee66c1b95b6538dfa3b5e2d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.1/cymphony_linux"
      sha256 "5fbcc93b572c87264100e0b63fb400c276dd8b1bb0df42aa9a492e250ff1d728"
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
