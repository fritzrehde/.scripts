#!/bin/bash

echo -n "todo: " 
read raw
single_seperator=$(echo $raw | sed 's/; /;/g')

IFS=';' read -ra todos <<< "$single_seperator"
for i in "${todos[@]}"
do
	# convert "!" suffix to importance
	if [ $(echo "$i" | awk '{ print $NF }') = "!" ]; then
		MOD=${i::-2}
		i="(A) $MOD"
	fi

	todo.sh add $i
done
