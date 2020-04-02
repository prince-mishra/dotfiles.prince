# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(command -v gls >/dev/null 2>&1)
then
  echo gls installed
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
else 
  echo gls not installed
  # some more ls aliases
  alias ll='ls -alF -color'
  alias la='ls -A -color'
  alias l='ls -CF -color'
fi