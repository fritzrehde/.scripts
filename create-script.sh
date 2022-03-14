#!/bin/bash

FILE=$1.sh

echo -e "#!/bin/bash\n\n" > $FILE
chmod +x $FILE
nvim + $FILE
