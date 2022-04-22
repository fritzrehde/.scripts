#!/bin/sh

case $1 in
	toggle|t)
		if nordvpn status | grep -q "Connected"; then
			vpn.sh disconnect
		else
			vpn.sh connect
		fi
		;;
	connect|c)
		nordvpn connect
		polybar-msg action vpn hook 1
		;;
	disconnect|d)
		nordvpn disconnect
		polybar-msg action vpn hook 0
		;;
	status|s)
		nordvpn status
		;;
esac
