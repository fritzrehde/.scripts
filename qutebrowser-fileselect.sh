#!/bin/sh

[ $# -ne 2 ] && exit 1

case $1 in
	directory)
		TYPE="directory"
		FZF_ARGS="+m"
		;;
	file)
		TYPE="file"
		FZF_ARGS="+m"
		;;
	files)
		TYPE="file"
		FZF_ARGS="-m"
		;;
esac

CMD="fd --type $TYPE --absolute-path | fzf $FZF_ARGS > $2"
st -c floating_tall -e sh -c "$CMD"
