#!/bin/sh

GIT_CMD="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

if [ $# -eq 0 ]; then
	COMMIT_MSG="Updated some config files"

	cd ~ || exit
	${GIT_CMD} add $(head -n -1 ~/.config_files)
	${GIT_CMD} commit -m "$COMMIT_MSG"
	${GIT_CMD} push

	if [ $? -eq 1 ]; then
		DUNST_MSG="Error"
		DUNST_ARGS="-u critical"
	else
		DUNST_MSG="Done"
	fi
	dunstify "$DUNST_MSG" "dotfiles" -t=2000 $DUNST_ARGS
else
	${GIT_CMD} $*
fi
