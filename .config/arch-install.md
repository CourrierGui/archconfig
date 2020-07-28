# Complete installation of archlinux

## Create bootable USB

Check signature: `pacman-key -v archlinux-version-x86_64.iso.sig`

Install arch on USB: `sudo dd bs=4M if=path_to_arch_iso of=/dev/sdx status=progress oflag=sync`

## USB Boot

**Use azerty keyboard layout:** `loadkeys fr-latin1`

**Network configuration:**
```
ip link
ip link set *interface* up
```

WPA Supplicant:
In `/etc/wpa_supplicant/wpa_supplicant.conf`

```
ctrl_interface=/run/wpa_supplicant
update_config=1
```

```
wpa_supplicant -B -i wlan0 -D wext -c /etc/wpa_supplicant/example.conf
wpa_cli
```

```
scan
scan_results
add_network 0
set_network 0 ssid "SSID"
set_network 0 psk "password"
enable_network 0
save_config
quit
```

### Partitions

```
fdisk /dev/sda
```

```
mkfs.vfat /dev/sda1 # /boot
mkfs.ext4 /dev/sda2 # /
mkswap /dev/sda3    # swap
swapon /dev/sda3
```

### Encrypted home partition

```
cryptsetup luksFormat /dev/sda4
cryptsetup open /dev/sda4 home-guillaume
```

### Mounting

```
mount /dev/sda2 /mnt                                # /
mkdir /mnt/boot
mkdir -p /home/guillaume
mount /dev/sda1 /mnt/boot                           # mount /boot
mount /dev/mapper/home-guillaume /mnt/home/guillame # mount /home/guillaume
```

### Selecting the mirrors

[Mirror list](archlinux.org/mirrors/status/)

```
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup
reflector --latest 50 --sort rate --save /etc/pacman.d/mirrorlist
```

Pacman hook:

### Install linux and basic packages

```
pacstrap /mnt base linux linux-firmware neovim networkmanager dhcpcd grub efibootmgr
```

### Configuraton

fstab: `genfstab -U /mnt >> /mnt/etc/fstab`

Become root: `arch-root /mnt`

Basic setup:

```
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime #set timezone
hwclock --systohc
echo "locale-gen" >> /etc/locale.gen
echo "KEYMAP=fr-latin1" >> /etc/vconsole.conf
echo "hostname" >> /etc/hostname
passwd
useradd -m guillaume
passwd guillaume
chown guillaume /mnt/home/guillaume
chgrp guillaume /mnt/home/guillaume
mkinitcpio -P
```

Encrypted `/home/guillaume` see [this](https://wiki.archlinux.org/index.php/Dm-crypt/Mounting_at_login) wiki page.

Grub:
```
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

Exit and reboot:

```
exit
umount -R /mnt
cryptsetup close home-guillaume
reboot
```

### Wifi

```
systemctl enable NetworkManager.service
nmcli device wifi connect "ssid" -a
timedatectl set-ntp true
```

### doas

```
echo "permit guillaume as root" >> /etc/doas.conf
```

### sudo

If vi is not installed: `ln -s /usr/bin/vi /usr/bin/nvim`

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

## Locate

```
sudo pacman -S locate
```

## Swap partition

Get the UUID of the partition: `sudo blkid`

Add to `/etc/fstab`:

```
UUID=uuid swap swap defaults 0 0
```
and reboot.

## Xorg

```
sudo pacman -S xorg-server xorg-init xorg-xev
```

### Setup

```
sudo pacman -S xf86-video-intel fakeroot
```

### Intel graphics driver

```
nvidia-390xx  nvidia-390xx-utils
```

### Suckless

`git clone https://github.com/CourrierGui/suckless ~/softwares/suckless`

*dwm:*
```
cd ~/softwares/suckless/dwm
sudo pacman -S libxinerama which ttf-joypixels dmenu gcc make pkg-config libxcb
sudo make install && make clean
```

*st:*

Install libxft-bgra from aur (emoji): `yay -S libxft-bgra`

```
sudo pacman -S patch man
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
sudo pacman -S webkit2gtk gcr
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
sudo pacman -S alsamixer pamixer
```

Select the correct sound card: `cat /proc/asound/cards`


For Asus Zenbook: edit `/usr/share/pulseaudio/alsa-mixer/paths/analog-output.conf.common` and add this:

```
[Element Master]
switch = mute
volume = ignore

[Element PCM]
switch = mute
volume = merge
override-map.1 = all
override-map.2 = all-left,all-right

[Element LFE]
switch = mute
volume = ignore
```

### Microphone

```
arecord -l
```

In `/etc/pulse/default.pa`

```
load-module module-alsa-source device=hw:0,0
# the line above should be somewhere before the line below
.ifexists module-udev-detect.so
```

Then: `pulseaudio -k ; pulseaudio -D`

```
arecord -f dat -r 60000 -D hw:0,0 -d 5 test.wav
grep "default-sample-rate" /etc/pulse/daemon.conf
```

## Yay

```
git clone https://aur.archlinux.org/yay.git ~/softwares/aur/yay
cd ~/softwares/aur/yay
makepkg -si
```

## Neovim

```
sudo pacman -S neovim ctags node npm clang xclip
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qa
```

Coc extensions will be installed when neovim starts

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

## Fingerprint reader

```
sudo pacman -S fprintd imagemagick
yay -S fingerprint-gui
```

Can't build fingerprint-gui due to `libfprint` and the fingerprints don't seem to be recognized...

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
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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

## Lock screen

`sudo pacman -S slock`

## Drawing

`sudo pacman -S xf86-input-wacom krita`

## Dash

Find files which could brake:
```
sudo pacman -S dash checkbashisms
find /usr/bin/ -type f -perm -o=r -print0 | xargs -0 gawk '/^#!.*( |[/])sh/{printf "%s\0", FILENAME} {nextfile}' | xargs -0 checkbashisms
```

Pacman hook:
```
[Trigger]
Type = Package
Operation = Install
Operation = Upgrade
Target = bash

[Action]
Description = Re-pointing /bin/sh symlink to dash...
When = PostTransaction
Exec = /usr/bin/ln -sfT dash /usr/bin/sh
Depends = dash
```

```
sudo ln -sfT /bin/sh /bin/dash
```
## Clear password from RAM

## Steam

Uncomment in `/etc/pacman.conf`:
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

Update system: `sudo pacman -Syu`

Install steam: `sudo pacman -S steam`

## Zathura

```
sudo pacman -S zathura zathura-pdf-mupdf zathura-djvu
```



## Notifications

```
sudo pacman -S notify-send dunst
mkdir ~/.config/dunst
cp /usr/share/dunst/dunstrc .config/dunst
```

## Pandoc

```
sudo pacman -S pandoc pandoc-citeproc pandoc-crossref
pip install pandoc-eqnos --user
```

## Android development

### Android SDK

```
yay -S android-sdk android-sdk-build-tools android-sdk-platform-tools android-platform
```

### Tools

```
sudo pacman -S emulator gradle
```

## Mount USB devices

```
sudo pacman -S udisks2
udisksctl (un)mount -b /dev/sd...
```

## Printer

```
sudo pacman -S cups cups-pdf avahi nss-mdns python-dbus python-gobject

systemctl enable org.cups.cupsd.service
systemctl start org.cups.cupsd.service ?
systemctl enable avahi-daemon.service ?
systemctl start avahi-daemon.service ?
```

Add: `mdns_minimal [NOTFOUND=return]` to `/etc/nsswitch.conf` at line `hosts:` before `resolve`
A reboot may be necessary.

```
lpinfo -m
sudo lpadmin -p QueueName -E -v <result from lpinfo> -m <result from lpinfo>
lpr # print
lpq # see print queue
```

## More packages

### Standard repos

```
sudo pacman -S python-pip htop tree cmake thunderbird thunderbird-i18n-fr doxygen graphviz wget usbutils mupdf automake autoconf valgrind xf86-input-wacom recordmydesktop python-matplotlib gtop powerline-fonts scrot sxiv tmux gnuplot mpv youtube-dl newsboat
```

### AUR

```
yay -S pfetch task-spooler lf brave-bin
```

### Pip

```
pip install numpy matplotlib
```

# Install script

**List installed packages:** `pacman -Qqe`
**Install packages:** `sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort packages.txt))`
