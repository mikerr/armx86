sudo mount -t sysfs sys /tmp/mnt/sys/
sudo mount -t proc proc /tmp/mnt/proc/
sudo mount –bind /dev /tmp/mnt/dev/
sudo mount –bind /dev/pts /tmp/mnt/dev/pts/
sudo mount –bind /dev/shm /tmp/mnt/dev/shm/

sudo chroot /home/pi/armx86/x86 /bin/su -l root
