#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="electric-tantra-linux"
iso_label="electric_tantra_linux_$(date +%Y%m)"
iso_publisher="Thomas Leon Highbaugh <thighbaugh@zoho.com>"
iso_application="A better way to install the same system on all my machines."
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito' 'uefi-x64.systemd-boot.esp' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
