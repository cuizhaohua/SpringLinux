TARGETS = mountkernfs.sh hostname.sh bootsplash udev keyboard-setup mountdevsubfs.sh hwclock.sh hdparm checkroot.sh console-setup mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh networking urandom alsa-utils screen-cleanup checkfs.sh checkroot-bootclean.sh udev-finish bootmisc.sh x11-common procps kmod
INTERACTIVE = udev keyboard-setup checkroot.sh console-setup checkfs.sh
udev: mountkernfs.sh
keyboard-setup: mountkernfs.sh udev
mountdevsubfs.sh: mountkernfs.sh udev
hwclock.sh: mountdevsubfs.sh
hdparm: mountdevsubfs.sh udev
checkroot.sh: hwclock.sh mountdevsubfs.sh hostname.sh hdparm keyboard-setup
console-setup: mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh
mountall.sh: checkfs.sh checkroot-bootclean.sh
mountall-bootclean.sh: mountall.sh
mountnfs.sh: mountall.sh mountall-bootclean.sh networking
mountnfs-bootclean.sh: mountall.sh mountall-bootclean.sh mountnfs.sh
networking: mountkernfs.sh mountall.sh mountall-bootclean.sh urandom
urandom: mountall.sh mountall-bootclean.sh hwclock.sh
alsa-utils: mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh
screen-cleanup: mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh
checkfs.sh: checkroot.sh
checkroot-bootclean.sh: checkroot.sh
udev-finish: udev mountall.sh mountall-bootclean.sh
bootmisc.sh: checkroot-bootclean.sh mountnfs-bootclean.sh mountall-bootclean.sh mountall.sh mountnfs.sh udev
x11-common: mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh
procps: mountkernfs.sh mountall.sh mountall-bootclean.sh udev
kmod: checkroot.sh
