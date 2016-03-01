
source ~/.git-completion.bash
source ~/.git-prompt.sh

export PS1="\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[33;1m\]\W\[\033[37m\]\$(__git_ps1)\[$WHITE\]\$ "
# alias to set a teb name
alias settab="printf '\e]1;%s\a'"
