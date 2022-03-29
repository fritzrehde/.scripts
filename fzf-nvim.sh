#!/bin/bash

FZF_OPTS=(--preview="cat {}")
# RELOAD=false

case $1 in
	config)
		SEARCH_PATH=~
		FILES=$(cat ~/.config_files)
		;;
	scripts)
		SEARCH_PATH=~/.local/bin
		FILES=$(ls ~/.local/bin)
		;;
	dir)
		case $2 in
			cur)
				CURRENT_PATH=$(tmux display-message -p '#{pane_CURRENT_PATH}')
				if SEARCH_PATH=$(cd "$CURRENT_PATH"; git rev-parse --show-toplevel 2> /dev/null) ; then
					FZF_OPTS+=("--header=$(basename ${SEARCH_PATH})")
				else
					SEARCH_PATH=$CURRENT_PATH
				fi
				;;
			~)
				SEARCH_PATH=$2
				# RELOAD=true
				;;
		esac

		FZF_OPTS+=("--bind=C:reload(fzf-nvim.sh dir ~)")
		# FZF_OPTS+=("--bind=>:")

		FD_OPTS=(-t f)
		FD_OPTS+=(--base-directory $SEARCH_PATH)
		# [ "$2" = "hidden" ] \
			# && FD_OPTS+=(--hidden)

		FILES=$(cd $SEARCH_PATH; fd "${FD_OPTS[@]}" | cut -c 3-)
		;;
esac

if [ $RELOAD ]; then
	echo "$FILES"
	exit 0
fi

count=$(tmux display-message -p '#{session_windows}')
(cd $SEARCH_PATH; echo "$FILES" | fzf "${FZF_OPTS[@]}" | tac | xargs -I % tmux new-window -ad "nvim %")
new_count=$(tmux display-message -p '#{session_windows}')
[[ count -ne new_count ]] && tmux next-window
