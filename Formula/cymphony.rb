class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.2/cymphony_macos_arm"
      sha256 "c9abe51d0c1d53aa235ed6f45380dd1c1c530d6e1a94369a5c6a060b67abcd46"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.2/cymphony_macos_intel"
      sha256 "551c0fa5a8b0feb8ab3372c081b1be7b4fca504c01590d14d4c9e3286758bc79"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.2/cymphony_linux"
      sha256 "b93211ea0fdf37ff724ec9a789bb16813f9f7882ecc3a9dfa610c474786931eb"
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
