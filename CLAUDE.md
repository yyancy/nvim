# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration based on LazyVim. It uses lazy.nvim as the plugin manager and includes custom plugins, keybindings, and utilities tailored for multilingual development (with Chinese input method support).

## Architecture

**Entry Point**: `init.lua` → `lua/config/lazy.lua`

**Core Structure**:
- `lua/config/` - Core configuration files (options, keymaps, autocmds, lazy.nvim setup)
- `lua/plugins/` - Plugin specifications organized by category:
  - `coding.lua` - Coding-related plugins (abolish, coerce, cmp, textobj-variable-segment)
  - `editor.lua` - Editor plugins (telescope, snippets)
  - `mini.lua` - Mini.nvim suite configurations
  - `ui.lua` - UI enhancements
  - `lsp.lua` - LSP configurations
- `lua/util/` - Custom utility modules:
  - `inputmethod.lua` - Auto-switches input method between Chinese/English on InsertEnter/InsertLeave
  - `yank.lua` - Enhanced yank behavior
  - `auto_wrap.lua` - Auto-formats paragraphs in text/markdown files on save
- `after/ftplugin/` - Filetype-specific settings
- `snippets/` - Custom snippets
- `vimrc.local` - Legacy vim configuration with custom keybindings and visual settings

**LazyVim Integration**: This config imports LazyVim base plugins plus extras:
- `lazyvim.plugins.extras.vscode` - VSCode integration
- `lazyvim.plugins.extras.editor.inc-rename` - Incremental rename
- `lazyvim.plugins.extras.editor.dial` - Enhanced increment/decrement

## Key Custom Features

### Input Method Auto-Switching
The `util/inputmethod.lua` module automatically switches between Chinese and English input methods when entering/leaving insert mode. Platform-specific commands:
- Linux: `fcitx-remote`
- Windows: `im-select.exe`
- macOS: `macism`

### Auto-Wrap for Text Files
The `util/auto_wrap.lua` module auto-formats paragraphs in text/markdown files on save (respects `textwidth=80`). Can be toggled per-buffer.

### Custom Keybindings Philosophy
- Space as leader key
- Emacs-style movement in insert/command mode (`<C-f>`, `<C-b>`, `<C-a>`, `<C-e>`, etc.)
- Tmux-aware window navigation via `vim-tmux-navigator`
- Visual mode: `p` and `P` are swapped for better paste behavior
- `H` → `_` (first non-blank), `L` → `$` (end of line)
- See `vimrc.local` and `lua/config/keymaps.lua` for full mappings

### Text Objects
- `iv`/`av` - variable segment (from `vim-textobj-variable-segment`)
- Standard vim-abolish for abbreviations/substitutions

## Development Commands

**Formatting**:
```bash
stylua . --config-path stylua.toml
```

**Plugin Management** (inside Neovim):
- `:Lazy` - Open lazy.nvim UI
- `:Lazy sync` - Install/update/clean plugins
- `:Lazy update` - Update plugins
- `:Lazy clean` - Remove unused plugins

**Key Telescope Commands**:
- `<leader>fP` - Find files in lazy.nvim plugin directory
- `<leader>fl` - Live grep in lazy plugin specs
- `;f` - Find files (including hidden/ignored)

## Important Notes

- **Clipboard**: Set to `unnamedplus` (system clipboard integration)
- **Indentation**: 2 spaces (shiftwidth=2, tabstop=2)
- **Text Width**: 80 columns with colorcolumn at 80
- **LSP Float Windows**: Max width limited to 50 characters (see `lua/config/options.lua`)
- **Python**: `g:python_recommended_style = 0` (disables python.vim's style enforcement)
- **Background Fix**: Scheduled dark background setting to fix rendering issues in Zellij

## Useful vim-visual-multi Tips (from README)

- `\\<CR>` - Enter single region mode (use `<tab>`/`<S-tab>` to move in insert mode)
- `\\n` or `\\N` - Generate sequence numbers
- `\\z` - Run normal command at cursors (e.g., `\\z` then `crs` for case conversion, `saiw'` to surround)
- `\\A` - Select all words
- `\\gS` - Reselect previous regions
- `\\c` - Add cursor at start of lines
- `\\C` - Word case convert

## File Locations

- Plugin lock file: `lazy-lock.json`
- LazyVim config: `lazyvim.json`
- Backup/undo: `~/.vim/tmp/backup/`, `~/.vim/tmp/undo/`
- Abolish save file: `after/plugin/abolish.vim`
