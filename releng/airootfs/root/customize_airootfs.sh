#!/usr/bin/env bash
#
# SPDX-License-Identifier: GPL-3.0-or-later

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist

## Disto Info
cat >"/etc/os-release" <<-EOL
	NAME="ElectricTantra"
	PRETTY_NAME="the Electric Tantra Linux"
	ID=arch
	BUILD_ID=rolling
	ANSI_COLOR="38;2;23;147;209"
	HOME_URL="https://github.com/Thomashighbaugh/dotfiles"
	LOGO=electric-tantra-logo
EOL

cat >"/etc/issue" <<-EOL
	ElectricTantra \r (\l)
EOL

systemctl enable NetworkManager.service
systemctl enable wpa_supplicant.service

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default graphical.target

# Enable Lightdm
systemctl enable lightdm.service

fc-cache -vf




