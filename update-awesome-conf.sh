#!/bin/bash

echo "Erasing the Current AwesomeWM Configuration in ISO Directory"
rm -rvf ./releng/airootfs/etc/skel/.config/awesome

echo "Copying the User Configuration There Now"
cp -rvf "$HOME"/.config/awesome ./releng/airootfs/etc/skel/.config/awesome

echo "Removing the Git Repository and VSCode Settings"
rm -rvf ./releng/airootfs/etc/skel/.config/awesome/.git
rm -rvf ./releng/airootfs/etc/skel/.config/awesome/.vscode

echo "AwesomeWM Complete"

echo "Erasing NVIM Configuration"
rm -rvf ./releng/airootfs/etc/skel/.config/nvim

echo "Copying the User Configuration There Now"
cp -rvf "$HOME"/.config/nvim ./releng/airootfs/etc/skel/.config/nvim

echo "Removing the Git Repository and VSCode Settings"
rm -rvf ./releng/airootfs/etc/skel/.config/nvim/.git
rm -rvf ./releng/airootfs/etc/skel/.config/nvim/.vscode

echo "NVIM Complete"

echo "Erasing XORG Configuration"
rm -rvf ./releng/airootfs/etc/skel/.Xresources.d
rm -rvf ./releng/airootfs/etc/skel/.xsessionrc
rm -rvf ./releng/airootfs/etc/skel/.xsettingsd

echo "Copying the User Configuration There Now"
mkdir -p ./releng/airootfs/etc/skel/.Xresources.d
mkdir -p ./releng/airootfs/etc/skel/.local/share
cp -rvf "$HOME"/dotfiles/home/xorg/color ./releng/airootfs/etc/skel/.Xresources.d
cp -rvf "$HOME"/dotfiles/home/xorg/font ./releng/airootfs/etc/skel/.Xresources.d
cp -rvf "$HOME"/dotfiles/home/xorg/rxvt-unicode ./releng/airootfs/etc/skel/.Xresources.d
cp -rvf "$HOME"/dotfiles/home/xorg/uxterm ./releng/airootfs/etc/skel/.Xresources.d
cp -rvf "$HOME"/dotfiles/home/xorg/xterm ./releng/airootfs/etc/skel/.Xresources.d
cp -rvf "$HOME"/.local/share/themes/dhumavati ./releng/airootfs/etc/skel/.local/share/themes
cp -rvf "$HOME"/.local/share/themes/dhumavati ./releng/airootfs/usr/share/themes
cp -rvf "$HOME"/dotfiles/home/xorg/xsessionrc ./releng/airootfs/etc/skel/.xsessionrc
cp -rvf "$HOME"/dotfiles/home/xorg/xsettingsd ./releng/airootfs/etc/skel/.xsettingsd


echo "Removing ZSH Configuration"

rm -rvf ./releng/airootfs/etc/skel/.zsh
 
echo "Copying Your ZSH Configuration There Now"
cp -rvf ~/.zshrc  ./releng/airootfs/etc/skel/
cp -rvf ~/.zshenv ./releng/airootfs/etc/skel/
cp -rvf ~/.zsh ./releng/airootfs/etc/skel/


echo "Removing the Git Repository and VSCode Settings"
rm -rvf ./releng/airootfs/etc/skel/.zsh/.git
rm -rvf ./releng/airootfs/etc/skel/.zsh/.vscode


echo "User Configuration Complete"
