#!/bin/bash

SCRIPTS=("fzf-nvim.sh scripts" dotfiles.sh new-script.sh sys-info.sh time.sh)
CMD=$(printf "%s\n" "${SCRIPTS[@]}" | rofi -dmenu)
case "$CMD" in
	"fzf-nvim.sh scripts")
		tmux display-popup -w 50% -h 60% -E 'fzf-nvim.sh scripts'
		;;
	*)
		echo $CMD | bash
		;;
esac
