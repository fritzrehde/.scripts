#!/bin/sh

BOSE=$(bluetoothctl info 04:52:C7:C7:A3:E8 | grep 'Connected: yes')

if [ -n "$BOSE" ]; then
	printf ""
fi
