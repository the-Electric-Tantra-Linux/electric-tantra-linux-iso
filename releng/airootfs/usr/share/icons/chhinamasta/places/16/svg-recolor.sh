#!/bin/bash
for i in *.svg; do sed -i 's/#323643/#f4f4f7/g' "$i" && echo "$i"; done
for i in *.svg; do sed -i 's/#555e70/#f4f4f7/g' "$i" && echo "$i"; done
