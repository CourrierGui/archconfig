bindkey -v           # vi key bindings
export KEYTIMEOUT=1  # reduce timeout between normal and insert mode

fpath=("$ZDOTDIR/themes" "$ZDOTDIR/plugin" $fpath) # add plugins and themes to path

source "$ZDOTDIR/aliases.zsh"       # list of aliases
source "$ZDOTDIR/themes/simple.zsh" # minimalistic terminal prompt
source "$ZDOTDIR/plugin/fzf.zsh"    # fzf completion
_gen_fzf_default_opts               # color theme for fzf
autoload -Uz cursor.zsh; cursor.zsh # change the cursor based on the vi mode

source "$ZDOTDIR/plugin/completion.zsh" # custom completion configuration
autoload -Uz compinit; compinit         # enable completion

## History command configuration

# record timestamp of command in HISTFILE
setopt EXTENDED_HISTORY

# delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_EXPIRE_DUPS_FIRST

setopt HIST_IGNORE_DUPS  # ignore duplicated commands history list
setopt HIST_IGNORE_SPACE # ignore commands that start with space
setopt HIST_VERIFY       # show command with history expansion to user before running it

pfetch
