# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/mihai/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/mihai/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/mihai/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/mihai/.fzf/shell/key-bindings.bash"

