#!/bin/bash

SCRIPTS=(extra.sh time.sh)
printf "%s\n" "${SCRIPTS[@]}" | rofi -dmenu | bash
