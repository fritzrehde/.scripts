#!/bin/bash

function toggle_prio()
{
	OLD_NR=$((10#$1))
	COUNTER=$2
	TODO_NR=$((OLD_NR - COUNTER))
	RETURN=$(todo.sh pri $TODO_NR A)

	if [ ! -z "$RETURN" ] ; then
		todo.sh depri $TODO_NR
	fi
}
export -f toggle_prio

declare -i i=0
todo.sh -Pd ~/.todo/config ls | fzf -e --ansi --with-nth=2.. | awk '{print $1}' | xargs -I % bash -c 'toggle_prio % i; i=$((i+1))'
