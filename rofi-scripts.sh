#!/bin/bash

SCRIPTS=(sys-info.sh time.sh)
printf "%s\n" "${SCRIPTS[@]}" | rofi -dmenu | bash
