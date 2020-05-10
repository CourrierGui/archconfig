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
sudo mkdir -p /media/guillaume/uuid/{Documents,Pictures,Videos,Music,dev,softwares}
sudo chown -R guillaume /media/guillaume/uuid
sudo chgrp -R guillaume /media/guillaume/uuid
```

Add symlink for each directory:
`ln -sf /media/guillaume/uuid/Documents /home/guillaume`

## Swap partition

Get the UUID of the partition: `sudo blkid`

Add to `/etc/fstab`:

```
UUID=uuid swap swap defaults 0 0
```
and reboot.

### Xorg
```
sudo pacman -S xorg-server xorg-init
```

#### Setup
```
sudo pacman -S xf86-video-intel fakeroot
```

#### Intel graphics driver

#### Suckless
`git clone https://github.com/CourrierGui/suckless ~/softwares/suckless`

*dwm:*
```
cd ~/softwares/suckless/dwm
sudo pacman -S libxinerama which ttf-joypixels dmenu gcc make pkg-config
sudo make install && make clean
```

*st:*

Install libxft-bgra from aur (emoji):
```
git clone https://aur.archlinux.org/libxft-bgra.git ~/softwares/aur/libxft-bgra
sudo pacman -S patch man
makepkg -si
sudo make install && make clean
```

If `makepkg` fails due to do a missing PGP key:
`gpg --keyserver pool.sks-keyservers.net --recv-keys missing_key_id`

Transparency: `sudo pacman -S xcompmgr`

Finally:
```
cd ~/softwares/st
sudo make install && make clean
```

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

```
create /etc/X11/Xwrapper.conf
allower_users=anybody
needs_root=yes
```

## Sound
```
sudo pacman -S alsamixer
```

Select the correct sound card: `cat /proc/asound/cards`

`sudo echo "defaults.pcm.card 0\ndefaults.ctl.card 0" > /etc/asound.conf`

Edit `/usr/share/pulseaudio/alsa-mixer/paths/analog-output.conf.common`
and change the line *volume = merge* under **PCM** to *volume = ignore*.

Using `alsamixer` set the PCM volume to a correct level.


## Neovim
```
sudo pacman -S neovim ctags node npm clang xclip
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qa
nvim --headless +CocInstall coc-julia coc-vimtex coc-clangd coc-python +qa
```

## Touchpad
```
sudo pacman -S xf86-input-libinput xorg-xinput
```

Add this to `/etc/X11/xorg.conf.d/30-touchpad.conf`
```
Section "InputClass"
    Identifier "touchpad catchall"
    Driver "libinput"
    Option "Tapping" "on"
EndSection
```

## Wallpaper
```
sudo pacman -S python-pywall imagemagick
```

## Keepass
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

## LaTeX

`sudo pacman -S texlive-most`

## zsh

```
sudo pacman -S zsh
chsh -s /usr/bin/zsh
```

Typewritten theme:
```
git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten
ln -s "$ZSH_CUSTOM/themes/typewritten/typewritten.zsh-theme" "$ZSH_CUSTOM/themes/typewritten.zsh-theme"
```

Oxide theme:
```
wget https://raw.githubusercontent.com/dikiaap/dotfiles/master/.oh-my-zsh/themes/oxide.zsh-theme
```

Zeta theme:
```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/skylerlee/zeta-zsh-theme/master/scripts/install.sh)"
```

nothing theme:
```
cd ~/.oh-my-zsh/themes/
wget https://raw.githubusercontent.com/eendroroy/nothing/master/nothing.zsh
mv nothing.zsh nothing.zsh-theme
```

## more packages
```
sudo pacman -S firefox htop tree cmake thunderbird thunderbird-i18n-fr doxygen graphviz pandoc wget
```
