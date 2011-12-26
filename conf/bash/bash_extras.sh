export PATH=/var/lib/gems/1.8/bin:$HOME/personal/bin/:$HOME/bin:$PATH 

duncan_sU()
{
    svn status $* | grep "^\s*?" | more
}
alias s?=duncan_sU

duncan_sM()
{
    svn status $* | grep "^\s*M" | more
}
alias sM=duncan_sM

duncan_sA()
{
    svn status $* | grep "^\s*A" | more
}
alias sA=duncan_sA

duncan_sS()
{
    svn status $* | more
}
alias sS=duncan_sS

alias uA='svn update ~/work ~/personal ~/anhedral'
alias sA='svn status ~/work ~/personal ~/anhedral'

alias gs='git status'
alias be='bundle exec'
alias ber='bundle exec rake'
alias gco='git checkout'
alias ga='git add'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

