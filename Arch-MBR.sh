#!/bin/bash
#timedatectl set-ntp true
#echo -e "n\np\n\n\n+1024MB\nt\n82\nw\n" | fdisk /dev/sda
#echo -e "n\np\n\n\n\nw\n" | fdisk /dev/sda
#mkfs.ext4 /dev/sda2
#mkswap /dev/sda1
#mount /dev/sda2 /mnt
#swapon /dev/sda1
#pacstrap /mnt base linux linux-firmware
#genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash <<"ZAK"
pacman --noconfirm -S vim
ln -sf /usr/share/zoneinfo/Europe/Tallinn /etc/localtime
hwclock --systohc
sed -i '/#en_US.UTF-8 UTF-8/s/^#//g' /etc/locale.gen
cat <<EOF > /etc/locale.conf
LANG=en_US.UTF-8
EOF
echo swamp > /etc/hostname
ZAK

#swapoff /dev/sda1
#umount -R /mnt

