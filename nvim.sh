#!/bin/zsh

num_args=$#
if [[ "$num_args" == 0 ]]; then
	exit 0
elif [[ "$num_args" == 1 ]]; then
	tmux new-window -a "nvim $1" 
else # arguments
	for a in $(echo "$@" | tac -s " ")
	do
		tmux new-window -a -d "nvim $a" 
	done
	tmux next-window
fi
