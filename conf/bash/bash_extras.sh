export PATH=/var/lib/gems/1.8/bin:$HOME/personal/bin/:$HOME/bin:$PATH
export GIT_EDITOR=emacs

alias gs='git status'
alias be='bundle exec'
alias ber='bundle exec rake'
alias gco='git checkout'
alias ga='git add'
alias gd='git diff --color'
alias gl='git log'
alias gc='git commit'
alias gss='git stash save'
alias gsp='git stash pop'
alias gpl='git pull --rebase'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
