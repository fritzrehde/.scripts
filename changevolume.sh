#!/bin/sh

send_notification()
{
	volume=$(pamixer --get-volume)
	dunstify "Volume: ${volume}%" -a "ignorehistory" -u low -t 1000 -r 9999 -h int:value:"$volume"
}

case $1 in
	up)
		pamixer --unmute
		pamixer --increase 5 --allow-boost
		send_notification
		;;
	down)
		pamixer --unmute
		pamixer --decrease 5 --allow-boost
		send_notification
		;;
	mute)
		pamixer --toggle-mute
		if pamixer --get-mute; then
			dunstify "Muted" -a "ignorehistory" -u low -t 1000 -r 9999
		else
			send_notification
		fi
		# polybar-msg action mute hook 0
		;;
esac
