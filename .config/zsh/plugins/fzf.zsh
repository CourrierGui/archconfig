source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# Alt-C: open fzf on all the subdirectories and preview the file tree
# Ctrl-R: search in command history:
# - ? toggle preview for long commands
# - ctrl-x: executes the selected command
export FZF_CTRL_R_OPTS="--preview 'preview {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --expect ctrl-x"

_gen_fzf_default_opts() {
	local base03="234"
	local base02="235"
	local base01="240"
	local base00="241"
	local base0="244"
	local base1="245"
	local base2="254"
	local base3="230"
	local yellow="136"
	local orange="166"
	local red="160"
	local magenta="125"
	local violet="61"
	local blue="33"
	local cyan="37"
	local green="64"

	# Solarized Dark color scheme for fzf
	export FZF_DEFAULT_OPTS="
	--color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
	--color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
	--preview 'preview {}'"
}

_fzf_complete_man(){
	local lbuf="$1"
	local prefix="$2"
	local name section dash description
	local matches=($(man -k . | fzf -m | while read -r name section dash description; do
		echo "$name.${${section#\(}%\)}"
	done))
	[ -z "$matches" ] && return 1
	LBUFFER="$LBUFFER${matches[@]}"
}

_fzf_complete_unalias() {
	local lbuf="$1"
	local prefix="$2"
	local aliases=(${(f)"$(alias)"})
	local matches=($(printf '%s\n' ${aliases[@]//=*/} | fzf --query="${prefix}"))
	[ -z "$matches" ] && return 1
	echo "${matches[@]//=*/}"
}

_fzf_complete_export() {
	local lbuf="$1"
	local prefix="$2"
	local matches=(${(f)"$(declare -x | fzf --query="${prefix}" --preview='eval echo \${}')"})
	[ -z "$matches" ] && return 1
	echo "${matches[@]//=*/}"
}
