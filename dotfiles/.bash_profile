. ~/.bash_profile_colours

function pow_create {
  ln -s $PWD ~/.pow/${1:-$(basename $PWD | tr A-Z a-z)}
}

function pow_open {
  open http://`basename $PWD`.dev/
}

function parse_git_branch_for_PS1 {
  # Get branch name:
  #  git symbolic-ref --short HEAD
  #
  # Ignores errors (EG: Not in a git repo):
  #   2> /dev/null
  #
  # Wrap the output in brackets for display in PS1
  #   sed -e 's/\(.*\)/(\1)/'
  git symbolic-ref --short HEAD 2> /dev/null | sed -e 's/\(.*\)/(\1)/'
}


function smart_git_push() {
  git push --set-upstream origin `git symbolic-ref --short HEAD`
}

PS1="\n$bldgrn\W $bldylw\$(parse_git_branch_for_PS1): $txtrst"

alias .bash_profile="subl ~/.bash_profile"
alias .gitconfig="subl ~/.gitconfig"
# See . files using ls
alias ls="ls -ah"

## RAILS SPECIFIC
alias devlog="tail -f -n 200 log/development.log"
alias testlog="tail -f -n 200 log/test.log"
alias be="bundle exec"
alias bo="EDITOR=subl bundle open"
alias bu="bundle update"
alias rebuild="be rake db:drop db:create db:migrate && be rake db:seed db:test:prepare"

# PROJECT SPECIFIC
alias work="cd ~/Work/"

## GIT
alias gbr="git branch"
alias gco="git checkout"
alias gp="git push"
alias gpl="git pull"
alias gpu="smart_git_push" # git push upstream
alias gst="git status"

# Required for homebrew
PATH="/usr/local/bin:$PATH:/usr/local/sbin"
# Requires for subl
PATH="~/bin:$PATH"

# Required for RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Required for 'bash-completion'
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
