#!/bin/sh

# notify once command is executed

eval "$1"
dunstify "Done" "$1"
