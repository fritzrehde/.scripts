#!/bin/sh

case $1 in
	new)
		gh repo create "$2" --clone --private
		# cd ./$2
		;;
esac
