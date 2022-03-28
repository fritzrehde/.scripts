#!/bin/bash

function torrent_id()
{
	echo "$1" | awk { 'print $1' }
}

case $1 in
	add)
		transmission-remote -a "$(xclip -selection clipboard -o)"
		;;
	toggle)
		[ "$(echo "$2" | awk { 'print $7' })" = "paused" ] \
			&& transmission-remote -t $(torrent_id "$2") -s \
			|| transmission-remote -t $(torrent_id "$2") -S
		;;
	start)
		transmission-remote -t $(torrent_id "$2") -s
		;;
	stop)
		transmission-remote -t $(torrent_id "$2") -S
		;;
	remove)
		transmission-remote -t $(torrent_id "$2") -r
		;;
	*)
		FZF_OPTS=$(
			tr -d '\n' <<-END
			--bind=
			j:down,
			k:up,
			q:abort,
			r:reload(transmission-remote -l),
			p:execute-silent(transmission.sh add)+reload(transmission-remote -l),
			space:execute-silent(transmission.sh toggle {})+reload(transmission-remote -l),
			x:execute-silent(transmission.sh remove {})+reload(transmission-remote -l)
			END
		)

		transmission-remote -l | head -n -1 | fzf "$FZF_OPTS" --disabled --header-lines=1 --prompt="" --pointer=" "
		;;
esac
