#!/bin/sh

COMMIT_MSG="Updated scripts"

cd ~/.local/bin || exit
git add -A
git commit -m "$COMMIT_MSG"
git push

[ $? -eq 1 ] \
	&& DUNST_MSG="git scripts error" \
	|| DUNST_MSG="git scripts success"
dunstify "$DUNST_MSG"
