# homebrew-cymphony

Homebrew tap for [cymphony](https://github.com/zaalipro/cymphony).

## Install

Two formulas are available — pick one:

| Formula | What it is | Erlang/Elixir | Install size |
|---|---|---|---|
| `cymphony` (recommended) | Pre-built self-contained binary | Bundled inside (Burrito) | ~11–17 MB launcher; ~80 MB after first-run unpack |
| `cymphony-lite` | Builds from source via `mix escript.build` | Pulled in via `brew install elixir` | ~3 MB binary, but Elixir+Erlang add ~250 MB |

### Bundled (default — no Elixir/Erlang needed)

```bash
brew tap zaalipro/cymphony
brew install cymphony
```

The binary self-contains its Erlang runtime and unpacks it to `~/.local/share/.burrito/` on first run.

### Lite (uses Homebrew's Elixir/Erlang)

Use this if you already have Elixir installed for other projects, or want a single shared runtime:

```bash
brew tap zaalipro/cymphony
brew install cymphony-lite
```

The two formulas conflict — install only one at a time. To switch:

```bash
brew uninstall cymphony && brew install cymphony-lite   # bundled → lite
brew uninstall cymphony-lite && brew install cymphony   # lite → bundled
```

Your config (`~/.cymphony/config.json`) and workspaces are unaffected by switching.

## Usage

First run triggers interactive setup:

```bash
cymphony
```

You'll be prompted for:
- GitHub repo URL
- Linear project slug
- Linear API key

Config is saved to `~/.cymphony/config.json`. Subsequent runs start the orchestration loop automatically.

Re-run setup anytime:

```bash
cymphony setup
```
