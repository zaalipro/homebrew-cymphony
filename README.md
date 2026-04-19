# homebrew-cymphony

Homebrew tap for [cymphony](https://github.com/zaalipro/cymphony).

## Install

```bash
brew tap zaalipro/cymphony
brew install cymphony
```

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
cymphony --setup
```
