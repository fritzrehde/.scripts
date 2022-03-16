#!/bin/bash

FZF_OPTS=(--preview="cat {}")
case $1 in
	config)
		search_path=~
		FILES=$(cat ~/.config_files | cut -c 3-)
		;;
	scripts)
		search_path=~/.local/bin
		FILES=$(ls ~/.local/bin)
		;;
	*)
		current_path=$(tmux display-message -p '#{pane_current_path}')
		if search_path=$(cd "$current_path"; git rev-parse --show-toplevel 2> /dev/null) ; then
			FZF_OPTS+=("--header=$(basename ${search_path})")
		else
			search_path=$current_path
		fi
		FILES=$(cd $search_path; fd -t f --base-directory $search_path | cut -c 3-)
		;;
esac

count=$(tmux display-message -p '#{session_windows}')
(cd $search_path; echo "$FILES" | fzf "${FZF_OPTS[@]}" | tac | xargs -I % tmux new-window -ad "nvim %")
new_count=$(tmux display-message -p '#{session_windows}')
[[ count -ne new_count ]] && tmux next-window
