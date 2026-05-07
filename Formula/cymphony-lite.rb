class CymphonyLite < Formula
  desc "Autonomous coding agent orchestrator (uses system Elixir/Erlang)"
  homepage "https://github.com/zaalipro/cymphony"
  url "https://github.com/zaalipro/cymphony/archive/refs/tags/v1.5.4.tar.gz"
  sha256 "d78f91cd2b4fef187a6c27956526b46573420156ea4a5b754b56255211bc774a"
  license "Apache-2.0"
  head "https://github.com/zaalipro/cymphony.git", branch: "main"

  depends_on "elixir"

  conflicts_with "cymphony", because: "both install bin/cymphony"

  def install
    erlang_prefix = Formula["erlang"].opt_prefix
    ENV.prepend_path "PATH", "#{erlang_prefix}/bin"

    system "mix", "local.hex", "--force"
    system "mix", "local.rebar", "--force"
    system "mix", "deps.get"
    system "mix", "escript.build"
    bin.install "bin/cymphony"

    # Patch shebang to use Homebrew's Erlang, not whatever is on user's PATH
    inreplace bin/"cymphony", "#! /usr/bin/env escript",
      "#!#{Formula["erlang"].opt_bin}/escript"
  end

  test do
    assert_match "cymphony", shell_output("#{bin}/cymphony 2>&1", 1)
  end
end
