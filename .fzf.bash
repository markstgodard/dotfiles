# Setup fzf
# ---------
if [[ ! "$PATH" =~ "/Users/mark/.fzf/bin" ]]; then
  export PATH="$PATH:/Users/mark/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" =~ "/Users/mark/.fzf/man" && -d "/Users/mark/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/mark/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- =~ i ]] && source "/Users/mark/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/mark/.fzf/shell/key-bindings.bash"

