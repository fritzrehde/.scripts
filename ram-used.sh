#!/bin/sh
printf "%.1f" $(free -m | awk '/Mem/ {print $3/1000}')
