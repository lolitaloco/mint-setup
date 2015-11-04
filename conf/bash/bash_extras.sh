export PATH=/var/lib/gems/1.8/bin:$HOME/personal/bin/:$HOME/bin:$PATH
export GIT_EDITOR=emacs
export BUNDLER_EDITOR=emacs
export RSENSE_HOME=/opt/rsense-0.3/

alias be='bundle exec'
alias bec='bundle exec cucumber'
alias becw='bundle exec cucumber --tags @wip'
alias ber='bundle exec rake'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff --color --word-diff'
alias gl='git log --decorate'
alias gpl='git pull --rebase'
alias gps='git push'
alias gs='git status'
alias gsp='git stash pop'
alias gss='git stash save'

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
