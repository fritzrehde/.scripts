#!/bin/bash

PDF="$1"
WID=$(xdo id)

case $2 in
	main)
		CONFIG=zathura
		;;
	alt)
		CONFIG=zathura/altrc
		;;
esac

xdo close $WID
zathura -c ~/.config/$CONFIG $PDF &
