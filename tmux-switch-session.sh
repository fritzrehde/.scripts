#!/bin/zsh

current_session=$(tmux display-message -p '#{session_name}')
tmux list-sessions -F '#{session_name}' | sed "/$current_session/d" | fzf +m -0 | xargs -I % tmux switch-client -t %
