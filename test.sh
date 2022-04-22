#!/bin/sh

trap "" INT
filter=""

input_file="$HOME/.local/bin/test.sh"

while true; do
    watch 'cat '"$input_file"'|fzf -f "'"$filter"'"'
    filter="$(fzf --print-query < "$input_file")"
    test $? -eq 130 && exit
    filter=`echo "$filter"|head -n1`
done
