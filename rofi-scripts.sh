#!/bin/sh

SCRIPTS=$(
	cat <<-END
	fzf-nvim scripts
	startup
	settings
	xrandr-monitor
	git-dotfiles
	git-scripts
	sys-info
	time
	color-picker
	webcam-preview
	END
)

CMD=$(echo "$SCRIPTS" | rofi -dmenu)
case "$CMD" in
	"fzf-nvim scripts")
		tmux display-popup -w 50% -h 60% -E "fzf-nvim.sh scripts"
		;;
	*)
		eval "$CMD.sh"
		;;
esac
