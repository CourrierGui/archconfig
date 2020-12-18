# Aliases
alias config='/usr/bin/git --git-dir=/home/guillaume/.cfg/ --work-tree=/home/guillaume'

alias ls='ls -hN --color=auto --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias lm='ls -t -1' # List files ordered by modification date
alias lt='ls --human-readable --size -1 -S --classify'
alias l='ls -CF'

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -vI'
alias rmdir='rmdir -v'
alias mkd='mkdir -pv'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
# alias ccat='highlight --color=auto'

alias note='nvim ~/Documents/notes'
alias potion='/home/guillaume/softwares/other/potion/bin/potion'

# Git
alias g='git'
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gl='git log'
alias gpl='git pull'
alias gps='git push'

alias tree='tree -C'
alias myip="curl ipinfo.io/ip"

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

alias yt='youtube-dl --add-metadata -i'
alias yta='yt -x -f bestaudio/best'
