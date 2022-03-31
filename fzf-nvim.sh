#!/bin/bash

FZF_OPTS=(--preview="cat {}")
case $1 in
	config)
		SEARCH_PATH=~
		FILES=$(cat ~/.config_files)
		;;
	scripts)
		SEARCH_PATH=~/.local/bin
		FILES=$(ls ~/.local/bin)
		;;
	*)
		CURRENT_PATH=$(tmux display-message -p '#{pane_current_path}')
		if SEARCH_PATH=$(cd "$CURRENT_PATH"; git rev-parse --show-toplevel 2> /dev/null) ; then
			FZF_OPTS+=("--header=$(basename "$SEARCH_PATH")")
		else
			SEARCH_PATH=$CURRENT_PATH
		fi
		FILES=$(cd "$SEARCH_PATH" || exit; fd -t f --base-directory "$SEARCH_PATH" | cut -c 3-)
		;;
esac

count=$(tmux display-message -p '#{session_windows}')
(cd "$SEARCH_PATH" || exit; echo "$FILES" | fzf "${FZF_OPTS[@]}" | tac | xargs -I % tmux new-window -ad "nvim %")
new_count=$(tmux display-message -p '#{session_windows}')
[ "$count" -ne "$new_count" ] && tmux next-window
