#!/bin/zsh

# UP/DOWN arrow cycle through history!

case "$OSTYPE" in
# Mac
darwin*)
  # Better history
  # Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys
  autoload -U up-line-or-beginning-search
  autoload -U down-line-or-beginning-search
  zle -N up-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "^[[A" up-line-or-beginning-search # Up
  bindkey "^[[B" down-line-or-beginning-search # Down
  ;;
# Linux
linux*)
  # start typing + [Up-Arrow] - fuzzy find history forward
  if [[ "${terminfo[kcuu1]}" != "" ]]; then
      autoload -U up-line-or-beginning-search
      zle -N up-line-or-beginning-search
      bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
  fi
  # start typing + [Down-Arrow] - fuzzy find history backward
  if [[ "${terminfo[kcud1]}" != "" ]]; then
      autoload -U down-line-or-beginning-search
      zle -N down-line-or-beginning-search
      bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
  fi
  ;;
esac
