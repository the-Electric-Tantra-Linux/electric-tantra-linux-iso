#!/bin/bash
##############################################################################
# A script to manage the build commands for the ELectric Tantra Linux
# Requires archiso to be installed on the system (obviously requires being run on Arch)
#



cr="$(tput setaf 1)"
cg="$(tput setaf 2)"
cy="$(tput setaf 3)"
cm="$(tput setaf 5)"
sb="$(tput bold)"
sn="$(tput sgr0)"


print() {
    case "$1" in
    t | title)
        shift
        printf "%s\n" "${sb}${cg}[###]$*${sn}"
        ;;
    s | step)
        shift
        printf "%s\n" "${sb}${cm}[===]$*${sn}"
        ;;
    e | error)
        shift
        printf "%s\n" "${sb}${cr}[!!!]$*${sn}"
        exit 1
        ;;
    w | warning)
        shift
        printf "%s\n" "${sb}${cy}[:::]$*${sn}"
        ;;
    *)
        printf '%s\n' "$*"
        ;;
    esac
}
clear
##############################################################################
##############################################################################
##############################################################################
print t "##############################################"
print t "the Electric Tantra Linux Build Script"
print t "##############################################"
echo
print s "##############################################"
print s "Phase 1:Build the Docker Environment" 
print s "##############################################"
echo
sudo docker build -t tantrik . 

print s "##############################################"
print s "Phase 2: Build the ISO Within the Docker Image"
print s "##############################################"
echo
sudo docker run -i -t --privileged -v `pwd`/iso:/iso --rm tantrik 
print t "##############################################"
print t "Good Luck, Hope It Runs!"
print t "##############################################"
