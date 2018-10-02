#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

plugins=(git zsh-autosuggestions wd golang heroku web-search)
fpath=(/usr/local/share/zsh-completions $fpath)

# Customize to your needs...
# If you come from bash you might have to change your $PATH.

ls ~/.profile_* 1> /dev/null 2>&1 && for f in ~/.profile_*; do source $f; done
typeset -gU path=(
  $HOME/bin
  $(brew --prefix)/sbin
  $(brew --prefix)/bin
  /usr/local/bin
  $path
  )

###### Tmux
#source ~/.bin/tmuxinator.zsh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags

# Example aliases
alias zshconfig="vim ~/.zshrc"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# added by newengsetup
export EDITOR=vim
export VISUAL=vim
export UBER_HOME="$HOME/Uber"
export UBER_OWNER="mihai@uber.com"
export UBER_LDAP_UID="mihai"
export VAGRANT_DEFAULT_PROVIDER=aws
export OPTOKEN="AAAAGTFtaWhhaUB1YmVyLmNvbSwxNDk5ODEwNTU0e8RYKzTEZvwViLA4xsmb956bXOQQtoerSNiLv-BfO5A="
[ -s "/usr/local/bin/virtualenvwrapper.sh" ] && . /usr/local/bin/virtualenvwrapper.sh
# [ -s "$HOME/.nvm/nvm.sh" ] && . $HOME/.nvm/nvm.sh
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

_sync_dir () {
    cmd=$1
    shift
    new_directory=$(boxer sync_dir $@)
    if [ "$?" -eq "0" ]; then
        $cmd $new_directory
    else
        echo "$new_directory"
    fi
}
cdsync () {
    _sync_dir cd $@
}
editsync () {
    _sync_dir $EDITOR $@
}
opensync () {
    _sync_dir open @
}

# alias to set a teb name
alias settab="printf '\e]1;%s\a'"

new_dev_box() {
    sed -i "s/$V_DEV/s$1/g" ~/.bash_profile
    source ~/.bash_profile
}
alias refreshdev=new_dev_box

export LC_USER_SCRIPT=true

ulimit -S -n 8048 

export PATH="/usr/local/opt/thrift@0.9/bin:$PATH"

# source ~/bin/loop_aliases.sh

# [[ -s "/Users/mihai/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/mihai/.sdkman/bin/sdkman-init.sh"
# brew python (sounds like "khan!!!!")
export VIRTUALENVWRAPPER_PYTHON=/usr/local/opt/python/libexec/bin/python

# Again ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/mihai/.sdkman"
