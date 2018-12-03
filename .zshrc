source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
	ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

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
# Again ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
