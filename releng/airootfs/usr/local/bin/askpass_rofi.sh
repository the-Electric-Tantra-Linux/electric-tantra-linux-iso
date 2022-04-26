#!/usr/bin/env bash

## rofi dir
DIR="$HOME/usr/share/rofi/askpass.rofi"

rofi -dmenu\
    -password\
    -i\
    -no-fixed-num-lines\
    -p "Sudo Password: "\
    -theme "$DIR"/askpass.rasi
