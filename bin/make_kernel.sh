#!/bin/bash

CMDLINE="rd.luks.uuid=luks-93 resume=UUID=d9 root=UUID=64 rootfstype=ext4 rootflags=rw,relatime,data=ordered"

cd /usr/src/linux
make -j5 && make modules_install

dracut --kernel-cmdline="$CMDLINE" --uefi --kernel-image arch/x86/boot/bzImage --force -a crypt /boot/EFI/gentoo/BOOTx64.efi 
cryptsetup luksOpen /dev/sda5 efikeys
mount /dev/mapper/efikeys /etc/efi
sbsign --key /etc/efi/db.key --cert /etc/efi/db.crt --output /boot/EFI/gentoo/BOOTx64.efi.signed /boot/EFI/gentoo/BOOTx64.efi
umount /etc/efi
cryptsetups luksClose efikeys

cd -
