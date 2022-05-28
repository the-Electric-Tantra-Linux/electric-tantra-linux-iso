#!/usr/bin/env bash
#
# SPDX-License-Identifier: GPL-3.0-or-later

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
sed -i 's/#greeter-session=example-gtk-greeter/greeter-session=lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf
sed -i 's/antergos/mahakali/g' /etc/lightdm/lightdm-webkit2-greeter.conf
locale-gen

sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist

## Disto Info
cat >"/etc/os-release" <<-EOL
	NAME="ElectricTantra"
	PRETTY_NAME="the Electric Tantra Linux"
	ID=arch
	BUILD_ID=rolling
	ANSI_COLOR="38;2;23;147;209"
	HOME_URL="https://github.com/the-Electric-Tantra-Linux"
	LOGO=electric-tantra-logo
EOL

cat >"/etc/issue" <<-EOL
	ElectricTantra \n \r (\l) \n 
EOL

systemctl enable NetworkManager.service
systemctl enable lm_sensors.service
systemctl enable thermald.service

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default graphical.target

# Enable Lightdm
systemctl enable lightdm.service

if [ -f "/etc/systemd/system/livecd.service" ]; then
	systemctl -fq enable livecd
fi
systemctl -fq enable systemd-networkd
if [ -f "/usr/lib/systemd/system/NetworkManager.service" ]; then
	systemctl -fq enable NetworkManager NetworkManager-wait-online
fi
if [ -f "/etc/systemd/system/livecd-alsa-unmuter.service" ]; then
	systemctl -fq enable livecd-alsa-unmuter
fi
if [ -f "/etc/systemd/system/vboxservice.service" ]; then
	systemctl -fq enable vboxservice
fi
systemctl -fq enable ModemManager
systemctl -fq enable upower

chmod +x /etc/lightdm/Xsession

# # Enable systemd-timesyncd (ntp)
systemctl -fq enable systemd-timesyncd

# echo "Adding autologin group"
# groupadd -r autologin
# echo "Adding nopasswdlogin group"
# groupadd -r nopasswdlogin
# echo "Adding  user"
# usermod -a -g users -G "audio,disk,optical,wheel,network,autologin,nopasswdlogin" liveuser
# chown -R liveuser:users /home/liveuser
# echo "DONE FIXING ROOT LOGIN"

# #Enable Repository Configuration
# systemctl -fq enable internet.service

# #Various fixes
if [ -f /usr/bin/update-ca-trust ]; then
	/usr/bin/update-ca-trust
fi
if [ -f /usr/bin/update-desktop-database ]; then
	/usr/bin/update-desktop-database --quiet
fi
if [ -f /usr/bin/update-mime-database ]; then
	/usr/bin/update-mime-database /usr/share/mime
fi
if [ -f /usr/bin/gdk-pixbuf-query-loaders ]; then
	/usr/bin/gdk-pixbuf-query-loaders --update-cache
fi

# # Fix sudoers
# chown -R root:root /etc/

fc-cache -vf
