#!/bin/sh

CUR_SESSION=$(tmux display-message -p '#{session_name}')

FILENAME=$(rofi -dmenu)
[ $? -eq 1 ] && exit 1

SESSION_NAME="download"
CMD="download.sh \"$(clipboard-paste.sh)\""
[ -n "$FILENAME" ] \
	&& CMD="$CMD \"$FILENAME\""
# CMD="yes \"$FILENAME\""

if tmux has-session -t "$SESSION_NAME"; then
	tmux new-window -d -t "$SESSION_NAME:" -n "$FILENAME" "$CMD"
else
	tmux new-session -d -s "$SESSION_NAME" -n "$FILENAME" "$CMD"
fi

tmux switch-client -t "$CUR_SESSION"
