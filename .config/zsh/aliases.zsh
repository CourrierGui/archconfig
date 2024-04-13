# Aliases
alias config='/usr/bin/git --git-dir=/home/guillaume/.cfg/ --work-tree=/home/guillaume'
alias cstat="config status"
alias cdiff="config diff"
alias cpush="config push"
alias cpull="config pull"
alias cadd="config add"
alias commit="config commit"
alias less="less -R"

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
alias gm='git mv'

alias tree='tree -C'
alias myip="curl ipinfo.io/ip"

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

alias yt='youtube-dl --add-metadata -i'
alias yta='yt -x -f bestaudio/best'

# Taskwarrior
alias today='$HOME/dev/clone/task_tools/tcal today'
alias inbox='task add +inbox'

update_kanban()
{
    cd ~/dev/projects/kanbanwarrior
    ./kanban page > ~/.config/kanban.html
    cd -
}

alias kanban_update='update_kanban'

tickle()
{
    deadline=$1
    shift
    inbox +tickle wait:$deadline $@
}

webpage_title()
{
    curl "$*" | hxnormalize -x | hxselect -s '\n' -c 'title'
}

read_and_review()
{
    link="$1"
    title=$(webpage_title "$link")
    echo "$title"
    descr="\"Read and review: $title\""
    echo $descr
    id=$(task add +rnr "$descr" | sed -n 's/Created task \(.*\)./\1/p')
    task "$id" annotate "$link"
}

alias rnr=read_and_review

get_tags()
{
    find -type f -and \( -name "*.[ch]pp" -or -name "*.py" -or -name "*.sh" \) > cscope.files
    ctags -R .
}

alias tags=get_tags
