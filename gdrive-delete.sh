#!/bin/sh

# delete files from google drive using fzf

gdrive list --no-header --order name \
	| awk '{ print $1, $2, $4 }' FS="   " OFS="," \
	| column -t -s ',' \
	| fzf --with-nth=2.. \
	| awk '{ print $1 }' \
	| xargs -I {} gdrive delete {}
