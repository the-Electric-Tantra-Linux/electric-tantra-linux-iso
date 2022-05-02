#!/bin/bash
##############################################################################
# This script functions as the build command, allowing me to run the build command through docker without needing to interact with the build process``

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
##############################################################################
##############################################################################
##############################################################################
function deleteTMPFS() {
    #    sudo pacman -Scc
    if [ -d "/tmp/mkarchiso" ]; then
        print s "##############################################"
        print s "Deleting TMPFS directory from the last build"
        print s "##############################################"
        sudo rm -rvf /tmp/mkarchiso*
        print s "Deletion Completion"
    fi

    print s "##############################################"
    print s "Ensure loopback dev nodes are created"
    print s "##############################################"
    mknod -m 0660 /dev/loop0 b 0 8
    losetup -f

    print s "##############################################"
    print s "Ensure iso directory is writable"
    print s "##############################################"
    chmod 755 /iso
    echo
    echo
}
##############################################################################
##############################################################################
##############################################################################
function mkarchiso {
    print s "##############################################"
    print s "Running the ISO Build Command"
    print s "##############################################"
    bash -c "sudo mkarchiso -v -w /tmp/mkarchiso-el /build/releng "
    print w "##############################################"
    print w "ISO Built"
    print w "##############################################"
    mv out/* /iso
    chmod 777 /iso/*.iso
    echo
    echo
}
print t "##############################################"
print t "mkarchiso Build Script"
print t "##############################################"
echo
echo
sleep 3s

echo
echo
print s "##############################################"
print s "Phase 1:Environment Setup"
print s "##############################################"
echo
echo
deleteTMPFS

print s "##############################################"
print s "Phase 2: Build"
print s "##############################################"
echo
echo
mkarchiso

print t "##############################################"
print t "Good Luck, Hope It Runs!"
print t "##############################################"
exit
