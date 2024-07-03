export PATH="./bin:/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
export PATH=$PATH:~/.bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/anaconda3/bin
export PATH=$PATH:~/programs
export PATH=$PATH:~/packages
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

# --- HomeBrew nonsense
case "$OSTYPE" in
# Mac
darwin*)
  # Links grep from "brew install grep"
  export PATH=$PATH:/opt/homebrew/opt/grep/libexec/gnubin
  # So c++ can see headers
  export CPATH=/opt/homebrew/include
  export LIBRARY_PATH=/opt/homebrew/lib
  ;;
esac

# NIX
export PATH=$PATH:/nix/var/nix/profiles/default/bin
