#!/bin/bash

GIT_CMD="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
if [ $# == 0 ]; then
	MSG="Updated some config files"
	${GIT_CMD} add $(head --lines -1 ~/.config_files)
	# head --lines -1 ~/.config_files | xargs -I % ${GIT_CMD} add %
	${GIT_CMD} commit -m "$MSG"; ${GIT_CMD} push
else
	${GIT_CMD} $*
fi
