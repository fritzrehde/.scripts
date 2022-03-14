#!/bin/zsh

FZF_OPTS=(--preview='cat {}')
current_path=$(tmux display-message -p '#{pane_current_path}')

if search_path=$(cd "$current_path"; git rev-parse --show-toplevel 2> /dev/null) ; then
	FZF_OPTS+=(--header=$(basename ${search_path}))
else
	search_path=$current_path
fi

count=$(tmux display-message -p '#{session_windows}')
(cd $search_path; fd -t f --base-directory $search_path | cut -c 3- | fzf ${FZF_OPTS} | tac | xargs -I % tmux new-window -a -d "nvim %")
new_count=$(tmux display-message -p '#{session_windows}')
if [[ count -ne new_count ]]; then tmux next-window; fi # go to next window only if a file was opened
