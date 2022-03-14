#!/bin/bash

# convert spaces to tabs in provided files

tab_size=$1
shift
for a in "$@"
do
	unexpand -t "$tab_size" $a > $a-notab
	mv $a-notab $a
done
