# Aliases
alias config='/usr/bin/git --git-dir=/home/guillaume/.cfg/ --work-tree=/home/guillaume'

alias ll='ls -alF --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -vI'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias note='nvim ~/Documents/notes'
alias potion='/home/guillaume/softwares/other/potion/bin/potion'

# Git
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gl='git log'
alias gpl='git pull'
alias gps='git push'

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index
