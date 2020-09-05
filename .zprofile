export PATH=$PATH:~/.local/bin:~/.local/bin/statusbar

# XDG config
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Zsh variables
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# Default programs
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st"
export BROWSER="brave"
export READER="zathura"

# This is the list for lf icons:
export LF_ICONS="di=📁:\
	fi=📃:\
	tw=🤝:\
	ow=📂:\
	ln=⛓:\
	or=❌:\
	ex=🎯:\
	*.txt=✍:\
	*.mom=✍:\
	*.me=✍:\
	*.ms=✍:\
	*.png=🖼:\
	*.webp=🖼:\
	*.ico=🖼:\
	*.jpg=📸:\
	*.jpe=📸:\
	*.jpeg=📸:\
	*.gif=🖼:\
	*.svg=🗺:\
	*.tif=🖼:\
	*.tiff=🖼:\
	*.xcf=🖌:\
	*.html=🌎:\
	*.xml=📰:\
	*.gpg=🔒:\
	*.css=🎨:\
	*.pdf=📚:\
	*.djvu=📚:\
	*.epub=📚:\
	*.csv=📓:\
	*.xlsx=📓:\
	*.tex=📜:\
	*.md=📘:\
	*.r=📊:\
	*.R=📊:\
	*.rmd=📊:\
	*.Rmd=📊:\
	*.m=📊:\
	*.mp3=🎵:\
	*.opus=🎵:\
	*.ogg=🎵:\
	*.m4a=🎵:\
	*.flac=🎼:\
	*.mkv=🎥:\
	*.mp4=🎥:\
	*.webm=🎥:\
	*.mpeg=🎥:\
	*.avi=🎥:\
	*.zip=📦:\
	*.rar=📦:\
	*.7z=📦:\
	*.tar.gz=📦:\
	*.z64=🎮:\
	*.v64=🎮:\
	*.n64=🎮:\
	*.gba=🎮:\
	*.nes=🎮:\
	*.gdi=🎮:\
	*.1=ℹ:\
	*.nfo=ℹ:\
	*.info=ℹ:\
	*.log=📙:\
	*.iso=📀:\
	*.img=📀:\
	*.bib=🎓:\
	*.ged=👪:\
	*.part=💔:\
	*.torrent=🔽:\
	*.jar=♨:\
	*.java=♨:\
	"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
