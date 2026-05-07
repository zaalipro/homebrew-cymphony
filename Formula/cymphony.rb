class Cymphony < Formula
  desc "Autonomous coding agent orchestrator (self-contained, bundles Erlang/Elixir)"
  homepage "https://github.com/zaalipro/cymphony"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.5/cymphony_macos_arm"
      sha256 "ea15f5e229f7c7aff5089458a52dfad78e897697d846bbce43d8443f93b498fb"
    end

    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.5/cymphony_macos_intel"
      sha256 "c851c3501c4ae7703e36480cba3a27c497bee2a13e455bf4282f85c185c1f26d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zaalipro/cymphony/releases/download/v1.5.5/cymphony_linux"
      sha256 "0a2b43e1d2dc3ab969c2b17684e9d610cf851255a1b73376ae3535f7c09c8c29"
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
