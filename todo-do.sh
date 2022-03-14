#!/bin/bash

todo.sh -Pd ~/.todo/config ls | fzf -e --ansi --with-nth=2.. | awk '{print $1}' | tr '\n' ' ' | xargs -I % todo.sh -fnA do %
