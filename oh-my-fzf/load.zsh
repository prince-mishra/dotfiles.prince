# fzf configuration

# Set default fzf command to use fd if available, otherwise use find
if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
else
  export FZF_DEFAULT_COMMAND='find . -type f -not -path "*/\.git/*"'
fi

# fzf key bindings and completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Custom fzf options
# Clean separation of concerns
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

# File operations get file preview
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {} 2>/dev/null || echo {}' --preview-window=right:60%"

# History operations get no preview (cleaner)
export FZF_CTRL_R_OPTS="--no-preview --exact"

# Directory operations get directory preview
export FZF_ALT_C_OPTS="--preview 'ls -la {}' --preview-window=right:60%"