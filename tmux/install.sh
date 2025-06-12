#!/bin/bash
#
# Setup Oh My Tmux from submodule

# Check if tmux is installed
if ! command -v tmux >/dev/null 2>&1; then
  echo "tmux not found. Install with: sudo apt install tmux"
  exit 1
fi

# Backup existing .tmux directory if it exists and is not a symlink
if [ -d "$HOME/.tmux" ] && [ ! -L "$HOME/.tmux" ]; then
  backup_name="$HOME/.tmux.backup.$(date +%Y%m%d_%H%M%S)"
  echo "Backing up existing .tmux to $backup_name"
  mv "$HOME/.tmux" "$backup_name"
fi

# Create symlink to Oh My Tmux if it doesn't exist
if [ ! -L "$HOME/.tmux" ]; then
  echo "Linking Oh My Tmux..."
  ln -s "$(pwd)/oh-my-tmux" "$HOME/.tmux"
fi

# Backup existing .tmux.conf if it exists and is not a symlink
if [ -f "$HOME/.tmux.conf" ] && [ ! -L "$HOME/.tmux.conf" ]; then
  backup_name="$HOME/.tmux.conf.backup.$(date +%Y%m%d_%H%M%S)"
  echo "Backing up existing .tmux.conf to $backup_name"
  mv "$HOME/.tmux.conf" "$backup_name"
fi

# Create symlink to main tmux config
if [ ! -f "$HOME/.tmux.conf" ]; then
  ln -s "$HOME/.tmux/.tmux.conf" "$HOME/.tmux.conf"
fi

