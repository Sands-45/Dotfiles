# Dotfiles

My macOS terminal setup in [Nord](https://www.nordtheme.com): **kitty**, **Neovim**, **Starship** and **eza**.

<p>
  <img width="49%" alt="kitty with Starship prompt" src="https://github.com/user-attachments/assets/4d21c666-c0d3-46c9-9b25-74341b3c1f39" />
  <img width="49%" alt="Neovim with nord.nvim" src="https://github.com/user-attachments/assets/932eaadc-41d1-429d-bb6d-0598d62026dd" />
</p>

## What's inside

| | |
| --- | --- |
| `kitty/` | Nord colors, SF Mono, rounded pill tabs at the bottom, custom icon |
| `nvim/` | lazy.nvim config with [nord.nvim](https://github.com/shaunsingh/nord.nvim), LSP, Telescope, nvim-tree |
| `starship/` | Two-line prompt built from Nord pills |
| `zsh/` | Starship + eza aliases, only inside kitty and Ghostty |

## Install

```sh
brew install --cask kitty font-symbols-only-nerd-font
brew install neovim starship eza ripgrep fd lazygit
cp /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SF-Mono-*.otf ~/Library/Fonts/

git clone https://github.com/Sands-45/Dotfiles.git ~/Dotfiles
~/Dotfiles/install.sh
```

`install.sh` symlinks the configs into `~/.config` and backs up anything it replaces.

## Neovim keys

Leader is `,`.

| Key | Action |
| --- | --- |
| `<C-d>` | Toggle file tree |
| `,ff` / `,fs` | Find files / search text |
| `gd` / `K` | Go to definition / hover |
| `,ca` / `,rn` | Code action / rename |
| `cmd+shift+f` | Format (also runs on save) |
| `gcc` | Toggle comment |

## Credits

[simonbs/dotfiles](https://github.com/simonbs/dotfiles) · [shaunsingh/nord.nvim](https://github.com/shaunsingh/nord.nvim) · [sodapopcan/kitty-icon](https://github.com/sodapopcan/kitty-icon)
