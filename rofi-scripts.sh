#!/bin/sh

SCRIPTS=$(
	cat <<-END
	startup.sh
	fzf-nvim.sh scripts
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
		eval "$HOME/.local/bin/$CMD"
		# sh -c "$HOME/.local/bin/$CMD"
		;;
esac
