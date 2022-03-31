#!/bin/sh

SCRIPTS=$(
	cat <<-END
	fzf-nvim.sh scripts
	startup.sh
	git-dotfiles.sh
	git-scripts.sh
	new-script.sh
	sys-info.sh
	time.sh
	color-picker.sh
	END
)

CMD=$(echo "$SCRIPTS" | rofi -dmenu)
case "$CMD" in
	"fzf-nvim.sh scripts")
		tmux display-popup -w 50% -h 60% -E 'fzf-nvim.sh scripts'
		;;
	*)
		# eval "$CMD"
		eval "$HOME/.local/bin/$CMD"
		# sh -c "$HOME/.local/bin/$CMD"
		;;
esac
