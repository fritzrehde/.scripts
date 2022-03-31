#!/bin/sh

pkill -USR1 -x sxhkd; dunstify "sxhkd reloaded" -a "ignorehistory" -t 500 -r 9997
