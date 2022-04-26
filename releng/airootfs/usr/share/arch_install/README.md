# Electric Tantra Linux Installer 

My bootstrap script to put arch linux on a system quickly and painlessly, no need to get flustered with the wiki authors nor switching between virtual consoles in a frenzied mess trying to remember commands. 

Eventually will become part of the Electric Tantra Linux and its installation process (which will fuse it into my dotfiles and pull from a homerolled repo)


to use it (like I do everytime I break my installation) follow these commands upon booting the live ISO 

```bash
pacman -S git glibc dialog 
git clone https://github.com/Thomashighbaugh/arch_install
cd arch_install
./setup

```
