#!/bin/env bash
##########################################################
## TITLE:
##
## DESCRIPTION:
##
##
## AUTHOR: Thomas Leon Highbaugh <admin@thomasleonhighbaugh.me>
##########################################################

function recolor() {
    sed -i 's/444/8b9cbe/g' **/*.svg
     sed -i 's/323a41/8b9cbe/g' **/*.svg

     sed -i 's/5d656b/8b9cbe/g' **/*.svg

     sed -i 's/4f4f4f/8b9cbe/g' **/*.svg

     sed -i 's/4f92db/0badff/g' **/*.svg

     sed -i 's/5ac0ff/00caff/g' **/*.svg

     sed -i 's/c2c2c2/b2bfs9/g' **/*.svg

     sed -i 's/f78f8f/ff3d81/g' **/*.svg

     sed -i 's/c74343/ff0a60/g' **/*.svg

    # sed -i 's/4877b1/0badff/g' **/*.svg

    # sed -i 's/5294e2/00caff/g' **/*.svg

    # sed -i 's/value_dark/3c3f4c/g' **/*.svg

    # sed -i 's/value_light/555e70/g' **/*.svg

    # sed -i 's/323232/8b9cbe/g' **/*.svg
    # sed -i 's/957552/3c3f4c/g' **/*.svg
    # sed -i 's/ae8e6c/555e70/g' **/*.svg
    # sed -i 's/1f252a/f4f4f7/g' **/*.svg
    # sed -i 's/00424a/00caff/g' **/*.svg
    # sed -i 's/0096aa/0badff/g' **/*.svg
    # sed -i 's/e95420/ac2175/g' **/*.svg
    # sed -i 's/eb6637/ff29a8/g' **/*.svg
    # sed -i 's/60924b/00fae9/g' **/*.svg
    # sed -i 's/87158/00fae9/g' **/*.svg
    # sed -i 's/5c6bc0/8265ff/g' **/*.svg
}

cd 16x16 && recolor && cd ..


cd 24x24 && recolor && cd ..
cd 32x32 && recolor && cd ..
cd 48x48 && recolor && cd ..
cd 64x64 && recolor && cd ..
cd 128x128 && recolor && cd ..
cd 256x256 && recolor && cd ..
