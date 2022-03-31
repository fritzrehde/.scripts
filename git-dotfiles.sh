#!/bin/sh

GIT_CMD="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

if [ $# -eq 0 ]; then
	COMMIT_MSG="Updated some config files"

	cd ~ || exit
	${GIT_CMD} add $(head -n -1 ~/.config_files)
	${GIT_CMD} commit -m "$COMMIT_MSG"
	${GIT_CMD} push

	[ $? -eq 1 ] \
		&& DUNST_MSG="Error" \
		|| DUNST_MSG="Done"
	dunstify "$DUNST_MSG" "dotfiles"
else
	${GIT_CMD} $*
fi
