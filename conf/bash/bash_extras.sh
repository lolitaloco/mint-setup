export PATH=/var/lib/gems/1.8/bin:$HOME/personal/bin/:$HOME/bin:$PATH 

alias gs='git status'
alias be='bundle exec'
alias ber='bundle exec rake'
alias gco='git checkout'
alias ga='git add'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm 1.9.2
rvm list
