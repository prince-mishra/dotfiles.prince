# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gl1="git log -1 --stat --oneline"
alias gp='git push origin HEAD'

# Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status'
alias gac='git add -A && git commit -m'
alias ge='git-edit-new'

# Make a branch on the upstream origin with same name as current branch
alias git-push-set-upstream='git push --set-upstream origin $(git branch --show-current)'

# Push all branches to origin!
alias git-push-all='git push --all'

# Delete all squashed branches locally
alias git-clean-squashed="git checkout master && git pull && gf && git-delete-squashed"
