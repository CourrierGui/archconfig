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

## Partitions

```
fdisk /dev/sdx
mkfs.ext4 /dev/sdx1
mount /dev/sdx1 /mnt
```

## Selecting the mirrors

## Install linux

```
pacstrap /mnt base linux linux-firmware
```

## Configuraton

**fstab:** `genfstab -U /mnt >> /mnt/etc/fstab`

**Become root:** `arch-root /mnt`

**Install necessary packages before reboot:** `pacman -S vim networkmanager dhcpcd git sudo`

**Basic setup:**

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

## Wifi

```
systemctl enable NetworkManager.service
nmcli device wifi connect "ssid" password "passwd"
timedatectl set-ntp true
```

## adduser
useradd -m guillaume
passwd guillaume
groupadd sudo
usermod -a -G sudo guillaume

# sudo
ln -s /usr/bin/vi /usr/bin/vim
visudo
add guillaume ALL=(ALL) ALL

## Xorg
sudo pacman -S xorg-server

### intel graphics driver

### Suckless
`git clone https://github.com/CourrierGui/suckless ~/softwares/suckless`

#### dwm
```
cd ~/softwares/suckless/dwm
sudo pacman -S libxinerama which ttf-joypixels dmenu gcc
sudo make install && make clean
```

#### st
```
cd ~/softwares/suckless/st
git clone https://github.com/LukeSmithxyz/st
sudo pacman -S make pkg-config gcc
```

**libxft-bgra from aur:**
```
gpg --keyserver pool.sks-keyservers.net --recv-keys missing_key_id
sudo pacman -S patch man
makepkg -si
make && sudo make install && make clean
```

**transparency:** `sudo pacman -S xcompmgr`

#### surf
```
cd ~/softwares/suckless/surf
sudo pacman -S webkit2gtk
sudo make install && make clean
```

#### dwmblocks
```
cd ~/softwares/suckless/dwmblocks
sudo make install && make clean
```


### setup
```
sudo pacman -S xf86-video-intel fakeroot
```
.xinitrc
.local/bin/startdw

create /etc/X11/Xwrapper.conf
allower_users=anybody
needs_root=yes

### sound
sudo pacman -S alsamixer
select correct sound card

## shared partition

## neovim
sudo pacman -S neovim ctags
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qa

## touch pad
sudo pacman -S xf86-input-libinput

## wallpaper
sudo pacman -S python-pywall imagemagick

## keepass
sudo pacman -S keepassxc

## ssh
sudo pacman -S openssh
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa

## zsh

## more
sudo pacman -S firefox htop tree cmake
