# Setup fzf
# ---------
if [[ ! "$PATH" == */home/guillaume/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/guillaume/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/guillaume/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/guillaume/.fzf/shell/key-bindings.bash"
