#!/bin/bash

START_DESKTOP=$(bspc query --desktops --desktop focused --names)
VIDEO_DESKTOP=$(bspc query --desktops --desktop any.!occupied --names)
MPV_ARGS=(--fs --profile=1440p)

if [ -z "$VIDEO_DESKTOP" ]; then
	dunstify "No available desktops" -a "ignorehistory" -u critical -t 1000 -r 9989
	exit 1
fi

case $1 in
	focus)
		bspc desktop -f "$VIDEO_DESKTOP"
		;;
	stay)
		MPV_ARGS+=(--pause --script-opts-append=osc-visibility=always)
		;;
esac

# mpv "${MPV_ARGS[*]}" "$(clipboard-paste.sh)"
clipboard-paste.sh | xargs mpv ${MPV_ARGS[*]}
bspc desktop -f "$START_DESKTOP"
