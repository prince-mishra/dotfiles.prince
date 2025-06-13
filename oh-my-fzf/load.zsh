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
export FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}' --height 40% --layout=reverse --border --preview-window=right:60%"
