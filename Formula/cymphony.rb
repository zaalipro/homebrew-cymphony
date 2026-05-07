class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.6/cymphony_macos_arm"
      sha256 "9ef8c468485d7cd7e826724f1d6a7e30f85e40639c3c9713987cd55239332a30"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.6/cymphony_macos_intel"
      sha256 "eaa0b3d4c9644176a2f08a51206df3ff03871d9f4f67337ac472a02f6a3d4c9b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.6/cymphony_linux"
      sha256 "fa4aa7da065bf351ae3a8ec5e6fc122138bbab660c904f90a60da35324229bc4"
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
