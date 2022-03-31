#!/bin/sh

COMMIT_MSG="Updated scripts"

cd ~/.local/bin || exit
git add -A
git commit -m "$COMMIT_MSG"
git push

if [ $? -eq 1 ]; then
	DUNST_MSG="Error"
else
	DUNST_MSG="Done"
	DUNST_ARGS="-u critical"
fi
dunstify "$DUNST_MSG" "scripts" "$DUNST_ARGS"
