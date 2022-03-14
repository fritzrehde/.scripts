#!/bin/zsh

current_window=$(tmux display-message -p '#{window_index}')
search_path=$(tmux display-message -p '#{pane_current_path}')
base_path=.
if [[ $search_path -ef ~ ]]; then
	search_path=~/code
	base_path=$search_path
fi
new_path=$(fd -t d --base-directory $search_path | cut -c 3- | fzf +m)
if [ ! -z $new_path ]; then
	tmux send-keys -t $current_window "cd $base_path/$new_path; clear" ENTER
fi
