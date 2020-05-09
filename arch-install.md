# Complete installation of archlinux

## Create bootable USB

`sudo dd bs=4M if=path_to_arch_iso of=/dev/sdx status=progress oflag=sync`

## USB Boot

**Use azerty keyboard layout:** `loadkeys fr-latin1`

**Network configuration:**
```
ip link
ip link set *interface* up
```

```
iw dev *interface* connect "ssid"
dhcpcd *interface*
timedatectl set-ntp true
```

### Partitions

```
fdisk /dev/sdx
mkfs.ext4 /dev/sdx1
mount /dev/sdx1 /mnt
```

### Selecting the mirrors

### Install linux

```
pacstrap /mnt base linux linux-firmware
```

### Configuraton

fstab: `genfstab -U /mnt >> /mnt/etc/fstab`

Become root: `arch-root /mnt`

Install necessary packages before reboot: `pacman -S vim networkmanager dhcpcd git sudo`

Basic setup:

```
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime #set timezone
hwclock --systohc
echo "locale-gen" >> /etc/locale.gen
echo "KEYMAP=fr-latin1" >> /etc/vconsole.conf
echo "hostname" >> /etc/hostname
passwd
exit
umount -R /mnt
reboot
```

### Wifi

```
systemctl enable NetworkManager.service
nmcli device wifi connect "ssid" password "passwd"
timedatectl set-ntp true
```

### adduser
```
useradd -m guillaume
passwd guillaume
```

### sudo
If vi is not installed: `ln -s /usr/bin/vi /usr/bin/vim`

```
visudo
```
Add the following line at the end: `guillaume ALL=(ALL) ALL`

## Shared partition for Documents, Pictures, ...

Get the UUID of the partition: `sudo blkid`

Add to `/etc/fstab`: 

```
UUID=uuid /media/guillaume/uuid ext4 defaults 0 2
```

Create the directories:
```
sudo mkdir -p /media/guillaume/uuid/{Documents,Pictures,Music,dev,softwares}
sudo chown -R guillaume /media/guillaume/uuid
sudo chgrp -R guillaume /media/guillaume/uuid
```

Add symlink for each directory:
`ln -sf /media/guillaume/uuid/Documents /home/guillaume`

### Xorg
```
sudo pacman -S xorg-server xorg-init
```

#### intel graphics driver

#### Suckless
`git clone https://github.com/CourrierGui/suckless ~/softwares/suckless`

*dwm:*
```
cd ~/softwares/suckless/dwm
sudo pacman -S libxinerama which ttf-joypixels dmenu gcc
sudo make install && make clean
```

*st:*
```
cd ~/softwares/suckless/st
git clone https://github.com/LukeSmithxyz/st
sudo pacman -S make pkg-config gcc
```

Install libxft-bgra from aur (emoji):
```
gpg --keyserver pool.sks-keyservers.net --recv-keys missing_key_id
sudo pacman -S patch man
makepkg -si
make && sudo make install && make clean
```

Transparency: `sudo pacman -S xcompmgr`

*surf:*
```
cd ~/softwares/suckless/surf
sudo pacman -S webkit2gtk
sudo make install && make clean
```

*dwmblocks:*
```
cd ~/softwares/suckless/dwmblocks
sudo make install && make clean
```

#### setup
```
sudo pacman -S xf86-video-intel fakeroot
```

```
create /etc/X11/Xwrapper.conf
allower_users=anybody
needs_root=yes
```

## sound
```
sudo pacman -S alsamixer
```

select correct sound card

## neovim
```
sudo pacman -S neovim ctags
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qa
```

## touch pad
```
sudo pacman -S xf86-input-libinput
```

## wallpaper
```
sudo pacman -S python-pywall imagemagick
```

## keepass
```
sudo pacman -S keepassxc
```

## ssh
```
sudo pacman -S openssh
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa
```

## zsh

## more packages
```
sudo pacman -S firefox htop tree cmake
```
