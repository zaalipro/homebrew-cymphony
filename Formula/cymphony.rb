class Cymphony < Formula
  desc "Autonomous coding agent orchestrator"
  homepage "https://github.com/zaalipro/cymphony"
  url "https://github.com/zaalipro/cymphony/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "b3da8f7f8d12ccec5cffd4afb32b6112de543cdc3ba876ceb61596c40530d739"
  license "Apache-2.0"
  head "https://github.com/zaalipro/cymphony.git", branch: "main"

  depends_on "elixir" => [:build, :runtime]

  def install
    erlang_prefix = Formula["erlang"].opt_prefix
    ENV.prepend_path "PATH", "#{erlang_prefix}/bin"

    cd "elixir" do
      system "mix", "local.hex", "--force"
      system "mix", "local.rebar", "--force"
      system "mix", "deps.get"
      system "mix", "escript.build"
      bin.install "bin/cymphony"
    end

    # Patch shebang to use Homebrew's Erlang, not whatever is on user's PATH
    inreplace bin/"cymphony", "#! /usr/bin/env escript",
      "#!#{Formula["erlang"].opt_bin}/escript"
  end

  test do
    assert_match "cymphony", shell_output("#{bin}/cymphony 2>&1", 1)
  end
end
