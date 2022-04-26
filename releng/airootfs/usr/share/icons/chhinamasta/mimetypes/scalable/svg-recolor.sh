#!/bin/bash
for i in *.svg; do sed -i 's/#323643/#555e70/g' "$i" && echo "$i"; done
