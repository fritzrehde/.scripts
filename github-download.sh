#!/bin/bash

for a in "$@"
do
	URL=$(echo $a | sed 's/github\.com/raw\.githubusercontent\.com/g')
	curl -sO ${URL/blob\//}
done
