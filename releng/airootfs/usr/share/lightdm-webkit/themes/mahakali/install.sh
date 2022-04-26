#!/bin/bash

sudo rm -rvf /usr/share/lightdm-webkit/themes/mahakali


sudo mkdir -p /usr/share/lightdm-webkit/themes/mahakali


sudo cp -rvf * /usr/share/lightdm-webkit/themes/mahakali

sudo cp -rvf lightdm.conf /etc/lightdm

sudo cp -rvf lightdm-webkit2-greeter.conf /etc/lightdm
