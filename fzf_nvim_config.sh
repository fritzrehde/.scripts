#!/bin/zsh

count=$(tmux display-message -p '#{session_windows}')
cat ~/.config_files | fzf --preview='cat {}' | tac | xargs -I % tmux new-window -a -d "nvim %"
new_count=$(tmux display-message -p '#{session_windows}')
if [[ count -ne new_count ]]; then tmux next-window; fi # go to next window only if a file was opened
