export PATH=/var/lib/gems/1.8/bin:$HOME/personal/bin/:$HOME/bin:$PATH
export GIT_EDITOR=emacs
export BUNDLER_EDITOR=emacs
export RSENSE_HOME=/opt/rsense-0.3/

alias gs='git status'
alias be='bundle exec'
alias ber='bundle exec rake'
alias gco='git checkout'
alias ga='git add'
alias gd='git diff --color --word-diff'
alias gl='git log'
alias gc='git commit'
alias gss='git stash save'
alias gsp='git stash pop'
alias gps='git push'
alias gpl='git pull --rebase'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
