#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
STAMP="$(date +%Y%m%d%H%M%S)"

link() {
  local src="$DIR/$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    mv "$dst" "$dst.backup-$STAMP"
    echo "backed up $dst"
  fi
  ln -sfn "$src" "$dst"
  echo "linked $dst"
}

link kitty "$HOME/.config/kitty"
link nvim "$HOME/.config/nvim"
link starship/starship.toml "$HOME/.config/starship.toml"

LINE="source \"$DIR/zsh/terminal.zsh\""
if ! grep -qxF "$LINE" "$HOME/.zshrc" 2>/dev/null; then
  printf '\n%s\n' "$LINE" >> "$HOME/.zshrc"
  echo "added terminal.zsh to ~/.zshrc"
fi
