#!/bin/bash
# Custom MBR type install of Arch
timedatectl set-ntp true
echo -e "n\np\n\n\n+1024MB\nt\n82\nw\n" | fdisk /dev/sda
echo -e "n\np\n\n\n\nw\n" | fdisk /dev/sda
mkfs.ext4 /dev/sda2
mkswap /dev/sda1
mount /dev/sda2 /mnt
swapon /dev/sda1
pacstrap /mnt base linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash <<"ZAK"
ln -sf /usr/share/zoneinfo/Europe/Tallinn /etc/localtime
hwclock --systohc
sed -i '/#en_US.UTF-8 UTF-8/s/^#//g' /etc/locale.gen
cat <<EOF > /etc/locale.conf
LANG=en_US.UTF-8
EOF
locale-gen
hname=swamp
echo $hname > /etc/hostname
echo "root:toor" | chpasswd
pacman --noconfirm -S vim net-tools dhcpcd \
man-db man-pages texinfo wget screen grub openssh git
systemctl enable dhcpcd@enp0s3
systemctl enable sshd
cat <<EOF > /etc/hosts
127.0.0.1       localhost 
::1             localhost 
127.0.1.1       $hname.localdomain $hname 
EOF
grub-install --target=i386-pc /dev/sda
grub-mkconfig  -o /boot/grub/grub.cfg
ZAK
swapoff /dev/sda1
umount -R /mnt

