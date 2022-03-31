#!/bin/bash

# add multiple todos (!-suffix means priority A) to todo.sh

echo -n "todo: "
read -r raw
single_seperator=${raw//; /;}

IFS=';' read -ra todos <<< "$single_seperator"
for i in "${todos[@]}"
do
	# convert "!" suffix to importance
	if [ "$(echo "$i" | awk '{ print $NF }')" = "!" ]; then
		MOD=${i::-2}
		i="(A) $MOD"
	fi
	todo.sh add "$i"
done
