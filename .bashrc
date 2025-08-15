
case $- in
	*i*) ;;
	*) return;;
esac

clear
# Comment out if statement if you dont have tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
 tmux new-session -d -s default "$SHELL"
 tmux split-window -v -t default:0 "bash $HOME/.motd; pause"
 tmux select-pane -D
 tmux attach-session -t default
fi


shopt -s histappend

HISTCONTROL=ignoreboth
HISTSIZE=20000
HISTFILESIZE=20000

shopt -s checkwinsize

# Change this to your / directory (as im on termux this is my one)
BASEPATH="/data/data/com.termux/files"

parse_git_branch() {
	git branch 2>/dev/null | sed -n '/\* /s///p' | sed 's/.*/ (\e[1;36m&\e[0;35m)/'
}

# My ps1
PS1='\[\e[0;90m\]╭─[\[\e[1;37m\]\t\[\e[0;90m\]]\[\e[0m\] \[\e[1;34m\]\u\[\e[0m\] \[\e[1;31m\]»\[\e[1;32m\]»\[\e[1;36m\] \w\[\e[0m\]$(parse_git_branch)\n\[\e[0;90m\]╰─\[\e[1;37m\]\$\[\e[0m\] '


alias ..='cd ..'
alias ~~='cd ~/' # this isnt really needed because you can just run cd on its own.

alias ls='ls --color '
alias lsa='ls -a '

alias brc="source ~/.bashrc"
alias cd="builtin cd"

mkcd() {
	mkdir "$1"
	cd "$1"
}

gcd() {
	git clone --reccuesive 1 $1
	dir_name=$(basename -s .git "$1")
	cd "$dir_name"
}

export DISPLAY=':1'

# Uncomment if you dont have tmux
# source ~/.motd
