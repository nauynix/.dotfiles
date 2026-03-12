# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository managed by [Dotbot](https://github.com/anishathalye/dotbot). Configs target macOS with zsh, tmux, and Neovim (AstroNvim v5).

## Installation & Symlinks

```bash
./install              # runs dotbot to create symlinks defined in install.conf.yaml
```

Dotbot is a git submodule in `dotbot/`. The symlink mappings are:
- `zshrc` → `~/.zshrc`
- `tmux.conf` → `~/.tmux.conf`
- `tmux.conf.local` → `~/.tmux.conf.local`
- `nvim/` → `~/.config/nvim`

## Neovim Configuration (AstroNvim v5)

Built on AstroNvim with Lazy.nvim plugin management. The load order is:

1. `nvim/init.lua` — bootstraps Lazy.nvim, then requires `lazy_setup` and `polish`
2. `nvim/lua/lazy_setup.lua` — configures Lazy with AstroNvim base, community imports, and user plugins
3. `nvim/lua/community.lua` — AstroCommunity plugin imports (loaded before `plugins/`)
4. `nvim/lua/plugins/` — individual plugin configs (one file per plugin/concern)
5. `nvim/lua/polish.lua` — runs last; post-setup tweaks (LSP diagnostics, OSC 52 clipboard, wildmenu)

Key customizations:
- Leader key is `<Space>`, local leader is `,`
- `plugins/astrocore.lua` contains all custom keymaps and autocmds
- BUILD file auto-formatting via `plz puku fmt` on save
- Lazygit integration via toggleterm with custom escape handling
- Leap.nvim for motion, Snacks picker for search (with exclusion globs for generated files)
- LSP diagnostics: underline, virtual text, and update-in-insert are all disabled

## Shell (zsh)

Uses oh-my-zsh with `robbyrussell` theme and `git`/`zsh-autosuggestions` plugins. Key aliases: `vim`→`nvim`, `gg`→`lazygit`.
