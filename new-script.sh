#!/bin/bash

FILE=~/.local/bin/$1.sh

echo -e "#!/bin/bash\n\n" > $FILE
chmod +x $FILE
tmux new-window -a "nvim + $FILE"
