#!/bin/sh

case $1 in
	connect|c)
		sudo protonvpn connect --fastest
		;;
	disconnect|d)
		sudo protonvpn disconnect
		;;
	status|s)
		sudo protonvpn status
		;;
esac
