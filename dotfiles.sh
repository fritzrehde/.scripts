#!/bin/bash

GIT_CMD="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
if [ $# == 0 ]; then
	MSG="Updated some config files"
	cd ~
	${GIT_CMD} add $(head -n -1 ~/.config_files)
	${GIT_CMD} commit -m "$MSG"
	${GIT_CMD} push
	[ $? -eq 1 ] && dunstify "dotfiles error"
else
	${GIT_CMD} $*
fi
