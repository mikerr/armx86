#!/bin/bash
# use qemu-user-static to emulate x86 binaries on arm

# prepare requirements
sudo apt-get install qemu qemu-user-static binfmt-support debootstrap binutils
mkdir x86

# download entire debian x86 distro / filesytem
sudo debootstrap --foreign --arch i386 stretch ./x86 http://ftp.us.debian.org/debian

# copy arm qemu into x86 filesystem
sudo cp /usr/bin/qemu-i386-static ./x86/usr/bin/

sudo mount -t sysfs sys ./x86/sys/
sudo mount -t proc proc ./x86/proc/
sudo mount --bind /dev ./x86/dev/
sudo mount --bind /dev/pts /x86/dev/pts/
sudo mount --bind /dev/shm ./x86/dev/shm/

sudo chroot ./x86/ /debootstrap/debootstrap --second-stage
