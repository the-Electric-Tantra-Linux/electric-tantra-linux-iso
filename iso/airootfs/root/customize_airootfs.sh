#!/bin/bash

set -e -u

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/

 sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime


sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf

sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service choose-mirror.service
systemctl set-default graphical.target
rm -rfv  /etc/systemd/system/display-manager.service 
systemctl enable lightdm 

## Services
systemctl enable NetworkManager.service 
systemctl enable wpa_supplicant.service


mkdir -p /boot/
mkinitcpio -P

## Mods
rm -rf /usr/share/xsessions/openbox-kde.desktop /usr/share/xsessions/i3-with-shmlog.desktop

## Remove localrepo lines
sed -i '$d' /etc/pacman.conf && sed -i '$d' /etc/pacman.conf && sed -i '$d' /etc/pacman.conf
