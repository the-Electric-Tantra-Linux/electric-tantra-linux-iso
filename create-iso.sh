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
function deleteTMPFS() {
    sudo pacman -Scc
    if [ -d "/tmp/mkarchiso" ]; then
        print s "Deleting TMPFS directory from the last build"
        sudo rm -rvf /tmp/mkarchiso*
        print s "Deletion Completion"
    fi

}
##############################################################################
##############################################################################
##############################################################################
function mkarchiso {
    print s "##############################################"
    print s "Running the ISO Build Command"
    print s "##############################################"
    sh -c "sudo mkarchiso -v -w /tmp/mkarchiso-el releng"
    print w "ISO Built"

}

print t "##############################################"
print t "mkarchiso Build Script"
print t "##############################################"
echo
print s "##############################################"
print s "Phase 1:Checking for build artifacts now..."
print s "##############################################"
echo
deleteTMPFS

print s "##############################################"
print s "Phase 2: Build"
print s "##############################################"
echo
mkarchiso

print t "##############################################"
print t "Good Luck, Hope It Runs!"
print t "##############################################"
