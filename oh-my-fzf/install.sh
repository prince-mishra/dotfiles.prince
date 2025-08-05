#!/bin/sh
#
# Install fzf from submodule

# Check if fzf is already installed and working
if command -v fzf >/dev/null 2>&1 && [ -f "$HOME/.fzf.zsh" ]; then
  echo "fzf already installed"
fi

# Backup existing .fzf directory if it exists and is not a symlink
if [ -d "$HOME/.fzf" ] && [ ! -L "$HOME/.fzf" ]; then
  backup_name="$HOME/.fzf.backup.$(date +%Y%m%d_%H%M%S)"
  echo "Backing up existing .fzf to $backup_name"
  mv "$HOME/.fzf" "$backup_name"
fi


# Install fzf from submodule
echo "Installing fzf..."
"$(pwd)/fzf/install" --bin --key-bindings --completion --no-update-rc

echo "fzf installed"
