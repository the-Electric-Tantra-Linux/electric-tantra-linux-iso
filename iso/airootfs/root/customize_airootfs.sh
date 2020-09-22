#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/


sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default graphical.target

## Services
systemctl enable NetworkManager.service 
systemctl enable wpa_supplicant.service

## Mods
sed -i -e 's/MODULES=()/MODULES=( nouveau )/g' /etc/mkinitcpio.conf
sed -i -e 's/Inherits=.*/Inherits=Papirus,Adwaita,gnome,hicolor/g' /usr/share/icons/Arc/index.theme
mv /usr/share/lxde/images/logout-banner.png /usr/share/lxde/images/logout-banner-old.png && cp /usr/share/pixmaps/logout-banner.png /usr/share/lxde/images/logout-banner.png
rm -rf /usr/share/xsessions/openbox-kde.desktop /usr/share/xsessions/i3-with-shmlog.desktop
cp /usr/bin/networkmanager_dmenu /usr/local/bin/nmd && sudo sed -i 's/config.ini/config-simple.ini/g' /usr/local/bin/nmd

## Remove localrepo lines
sed -i '$d' /etc/pacman.conf && sed -i '$d' /etc/pacman.conf && sed -i '$d' /etc/pacman.conf
