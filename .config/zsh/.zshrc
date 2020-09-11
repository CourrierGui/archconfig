bindkey -v
export KEYTIMEOUT=1

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

fpath=("$ZDOTDIR/themes" "$ZDOTDIR/plugin" $fpath)

autoload -Uz compinit; compinit

# partial completion suggestions zstyle ':completion:*' list-suffixes zstyle

_comp_options+=(globdots) # With hidden files
autoload -Uz completion.zsh; completion.zsh

autoload -Uz purification; purification
autoload -Uz cursor; cursor
source "$ZDOTDIR/aliases.zsh"

setopt AUTO_PUSHD        # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS # Do not store duplicates in the stack.
setopt PUSHD_SILENT      # Do not print the directory stack after pushd or popd

## History command configuration
setopt EXTENDED_HISTORY       # record timestamp of command in HISTFILE
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_IGNORE_DUPS       # ignore duplicated commands history list
setopt HIST_IGNORE_SPACE      # ignore commands that start with space
setopt HIST_VERIFY            # show command with history expansion to user before running it

zle -C hist-complete complete-word _generic
zstyle ':completion:hist-complete:*' completer _history

autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

pfetch
