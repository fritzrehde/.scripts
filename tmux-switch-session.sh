#!/bin/bash

current_session=$(tmux display-message -p '#{session_name}')
SESSIONS=$(tmux list-sessions -F '#{session_name}' | sed "/$current_session/d")
if [ $(echo "$SESSIONS" | wc -l) -eq 1 ]; then
	tmux switch-client -t "$SESSIONS"
else
	tmux display-popup -w 50% -h 60% -E "echo \"$SESSIONS\" | fzf +m -0 | xargs -I % tmux switch-client -t %"
fi
