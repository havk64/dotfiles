### Set vi-style on command prompt
set -o vi

### Set locale
export LC_ALL=en_US.UTF-8

#added to fix node.js installation:
export PATH="$PATH:$HOME/.node/bin"

### Added to allow PostgreSQL run locally
### export DATABASE_URL=postgres:///$(whoami)

### Added by me for liquidprompt
[[ $- = *i* ]] && source "$HOME/liquidprompt/liquidprompt"

### Added by NVM install through HomeBrew:
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

alias gcam='git commit -am'
alias gcm='git commit -m'
alias gpom='git push origin master'
alias krails='bin/rails'
alias gst='git status .'
alias gdif='git diff'
alias gds='git diff --staged'
alias gtp='git log --pretty=oneline --graph --decorate --all'
alias ll='ls -la'
alias chx='chmod +x'
alias ect='emacsclient -t'

### Added by Holberton projecct 181:
export AIRBNB_ENV=development
export AIRBNB_DATABASE_PWD_DEV='yXBb*Xj?W83EeXX'

### Added by Toptal tips:
### (Share the bash history across multiple sessions)
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
## Unlimited bash history:
export HISTSIZE=
export HISTFILESIZE=

# Included by homebrew
export PATH="/usr/local/sbin:$PATH"

# Included for GPG Tools
GPG_TTY=$(tty)
export GPG_TTY

. /Users/alexandro/torch/install/bin/torch-activate

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
