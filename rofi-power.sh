#!/bin/sh

chosen=$(printf " Suspend\n Hibernate\n Reboot\n Shutdown" | rofi -dmenu -i -theme ~/.config/rofi/themes/power.rasi)

case "$chosen" in
	" Suspend") systemctl suspend ;;
	" Hibernate") systemctl hibernate ;;
	" Reboot") reboot ;;
	" Shutdown") shutdown now ;;
	*) exit 1 ;;
esac
