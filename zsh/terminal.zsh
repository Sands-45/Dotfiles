if [[ -n "$GHOSTTY_RESOURCES_DIR" || -n "$KITTY_WINDOW_ID" ]]; then
  if command -v eza >/dev/null 2>&1; then
    alias ls='eza --icons=auto'
    alias ll='eza -lh --icons=auto'
    alias la='eza -lha --icons=auto'
    alias l='eza -l --icons=auto'
    alias lsd='eza -lha --no-permissions --no-user --time-style=relative --icons=auto'
    alias lt='eza --tree --icons=auto'
    alias lt1='lt --level=1'
    alias lt2='lt --level=2'
    alias lt3='lt --level=3'
    alias lt4='lt --level=4'
    alias lt5='lt --level=5'
  fi
  if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
  fi
fi
