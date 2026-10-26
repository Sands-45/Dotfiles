# Dotfiles

My macOS terminal setup: **kitty**, **Neovim**, **Starship** and **eza**, all in the [Nord](https://www.nordtheme.com) palette. Inspired by [simonbs/dotfiles](https://github.com/simonbs/dotfiles) and the [shaunsingh/nord.nvim](https://github.com/shaunsingh/nord.nvim) look.

```
kitty/        kitty.conf, pill tab bar (tab_bar.py), custom app icon
nvim/         Neovim config (lazy.nvim, modules under lua/sands)
starship/     starship.toml prompt
zsh/          terminal.zsh: eza aliases + Starship init
install.sh    symlinks everything into place
```

## Requirements

```sh
brew install --cask kitty
brew install neovim starship eza ripgrep fd lazygit tree-sitter-cli
brew install --cask font-symbols-only-nerd-font
```

- **Font:** SF Mono. It ships inside Terminal.app but isn't installed system-wide; copy it into `~/Library/Fonts`:
  `cp /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SF-Mono-*.otf ~/Library/Fonts/`
- **Apple Silicon:** everything must be native arm64. Make sure `/opt/homebrew/bin` comes first on your `PATH`.

## Install

```sh
git clone <this repo> ~/Dotfiles && cd ~/Dotfiles
./install.sh
```

The script symlinks `kitty/` and `nvim/` into `~/.config`, links `starship.toml`, and adds one `source` line to `~/.zshrc`. Anything already in place is moved to a `.backup-<timestamp>` copy first. Open Neovim once and lazy.nvim installs the plugins pinned in `lazy-lock.json`.

## kitty

- Nord colors, SF Mono 13, line height 118% (`modify_font cell_height`), thinner text rendering (`text_composition_strategy 1.0 0`).
- **Pill tabs at the bottom.** `tab_bar.py` draws rounded tabs (`` caps) showing the tab number and current folder. The active tab is Nord cyan, the others are dark grey. Margins match the window padding.
- Asks before closing a window with two or more terminals (`confirm_os_window_close 2`).
- `cmd+t` opens a new tab in the current folder. `cmd+d` / `cmd+shift+d` split the window.
- Custom `>^_^<` icon from [sodapopcan/kitty-icon](https://github.com/sodapopcan/kitty-icon). kitty picks up `kitty.app.png` from its config folder on restart.

## Starship

Two-line prompt built from Nord-colored pills:

- **Left:** directory, then git branch and status.
- **Right:** language versions (Node, Bun, Python, Rust, …), command duration and exit status.

Bun shows all the time through a small custom module. Google Cloud is hidden. Each pill has one space of padding inside.

## zsh

`terminal.zsh` only runs inside kitty or Ghostty, so Terminal.app and editor terminals keep the plain prompt. It turns on Starship and swaps `ls` for eza with icons (`ll`, `la`, `lt`, `lt1`–`lt5` for tree views).

## Neovim

Uses the shaunsingh **nord.nvim** theme with bold and italics turned off. It adds:

- borderless splits;
- a minimal winbar showing the filename and filetype icon;
- a flat lualine statusline on the editor background, with rounded pills for the mode and cursor position (the same caps as the kitty tabs);
- bufferline tabs.

| Area | Plugins |
| --- | --- |
| UI | nord.nvim, lualine, bufferline, nvim-tree, alpha, dressing, which-key, indent-blankline |
| Editing | treesitter, Comment.nvim, nvim-surround, autopairs, substitute, todo-comments |
| Search | telescope (+ fzf-native) |
| LSP | mason, mason-lspconfig v2, nvim-lspconfig (`vim.lsp.config`), nvim-cmp + LuaSnip |
| Tooling | conform (formatting), nvim-lint, gitsigns, lazygit, trouble, auto-session |

### Keys

Leader is `,`. Arrow keys are left enabled.

| Key | Action |
| --- | --- |
| `<C-d>` | Toggle file tree |
| `,r` | Reveal current file in tree |
| `<C-p>f` / `g` / `b` / `h` | Telescope: files, grep, buffers, help |
| `,ff` / `,fs` / `,fr` | Find files, live grep, recent files |
| `gd` / `gR` / `K` | Definition, references, hover |
| `,ca` / `,rn` | Code action, rename |
| `[d` / `]d` | Previous/next diagnostic |
| `,w` | Save |
| `gcc` / `gbc` | Toggle line/block comment |

### Notes

- **Swift:** the Swift treesitter parser is skipped (`ignore_install`), because it doesn't build with tree-sitter CLI 0.27.
- **Plugin with local changes:** if `:Lazy update` reports local changes in a plugin, select it in the Lazy window, press `x` to remove it, then `I` to reinstall.
