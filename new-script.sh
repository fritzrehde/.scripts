#!/bin/sh

FILE=~/.local/bin/$1.sh

printf "#!/bin/bash\n\n" > "$FILE"
chmod +x "$FILE"
tmux new-window -a "nvim + $FILE"
