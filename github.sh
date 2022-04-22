#!/bin/sh

case $1 in
	create)
		gh repo create "$2" --clone --private
		# cd ./$2
		;;
esac
