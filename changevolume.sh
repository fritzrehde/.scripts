#!/bin/sh

send_notification()
{
	volume=$(pamixer --get-volume)
	dunstify "Volume: ${volume}%" -a "ignorehistory" -u low -t 1000 -r 9999 -h int:value:"$volume"
}

case $1 in
	up)
		# Set the volume on (if it was muted)
		pamixer -u
		pamixer -i 5 --allow-boost
		send_notification
		;;
	down)
		pamixer -u
		pamixer -d 5 --allow-boost
		send_notification
		;;
	mute)
		pamixer -t
		if pamixer --get-mute; then
			dunstify "Muted" -a "ignorehistory" -u low -t 1000 -r 9999
		else
			send_notification
		fi
		;;
esac
