#!/bin/bash

sleep ${1}m
dunstify "Timer up" -a "ignorehistory" -u low -t 0 -r 9990
