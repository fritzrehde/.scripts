#!/bin/sh

# create new shell script

[ -z "$1" ] && exit 1

FILE=~/.local/bin/$1.sh
printf "#!/bin/sh\n\n\n" > "$FILE"
chmod +x "$FILE"
tmux new-window -a "nvim + $FILE"
