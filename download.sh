#!/bin/sh

OUTPUT_DIR=~/Downloads/videos
INPUT="$1"
OUTPUT="$2"

case $# in
	1)
		yt-dlp "$INPUT"
		;;
	2)
		yt-dlp \
			-o "$OUTPUT_DIR"/"$OUTPUT".mp4 \
			"$INPUT"
		;;
	*)
		echo "Usage: $(basename $0) <INPUT-URL> [<OUTPUT-FILENAME>]" 2>&1
		exit 1
		;;
esac
