#!/bin/bash

MSG="Updated scripts"
cd ~/.local/bin
git add -A
git commit -m "$MSG"
git push
[ $? -eq 1 ] && MSG="git scripts error" || MSG="git scripts success"
dunstify "$MSG"
