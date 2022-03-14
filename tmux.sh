#!/bin/zsh

if [[ $# == 1 ]]; then
	tmux new-session -A -s "$1"
else
	tmux new-session -A -s misc
fi
