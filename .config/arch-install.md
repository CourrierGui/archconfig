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
dhcpcd wlan0
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
mkfs.ext4 /dev/mapper/home-guillaume
```

### Mounting

```
mount /dev/sda2 /mnt                                # /
mkdir /mnt/boot
mkdir -p /mnt/home/guillaume
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
pacstrap /mnt base linux linux-firmware neovim networkmanager dhcpcd grub efibootmgr sudo opendoas go git fakeroot reflector binutils make gcc
```

### Configuraton

fstab: `genfstab -U /mnt >> /mnt/etc/fstab`

Become root: `arch-chroot /mnt`

Basic setup:

```
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime #set timezone
hwclock --systohc
```

Uncomment `fr_FR.UTF-8 UTF-8` in `/etc/locale.gen` then run `locale-gen`.

```
echo "KEYMAP=fr-latin1" >> /etc/vconsole.conf
echo "LANG=fr_FR.UTF-8" >> /etc/locale.conf
echo "hostname" >> /etc/hostname
passwd
useradd -m guillaume
groupadd sudo
usermod -a -G sudo guillaume
passwd guillaume
chown guillaume /home/guillaume
chgrp guillaume /home/guillaume
mkinitcpio -P
```

Encrypted `/home/guillaume` see [this](https://wiki.archlinux.org/index.php/Dm-crypt/Mounting_at_login) wiki page.
Do decrypt during boot add:

```
GRUB_CMDLINE_LINUX="root=/dev/mapper/root cryptdevice=/dev/nvme0n1p7:root"
```

Grub:

EFI partition:

```
mkdir /boot/efi
mount /dev/sda1 /boot/efi
```
Install `os-prober` and edit `/etc/default/grub` to uncomment
`GRUB_DISABLE_OS_PROBER=false` and `GRUB_ENABLE_CRYPTODISK=y.

```
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Grub
grub-mkconfig -o /boot/grub/grub.cfg
```

Exit and reboot:

```
exit
umount -R /mnt
cryptsetup close home-guillaume
reboot
```

### doas

```
su root
echo "permit persist guillaume as root" >> /etc/doas.conf
```

### Wifi

```
# systemctl enable NetworkManager.service
# systemctl start NetworkManager
$ nmcli device wifi list
# nmcli device wifi connect "ssid" -a
# timedatectl set-ntp true
```

## Intel microcode

```
# pacman -S intel-ucode
# grub-mkconfig -o /boot/grub/grub.cfg
```

Check if successful: `dmesg | grep microcode`

### sudo

`yay -S opendoas-sudo`

If vi is not installed: `ln -s /usr/bin/vi /usr/bin/nvim`

```
# visudo
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
sudo pacman -S xorg-server xorg-xinit xorg-xev
```

### Setup

```
sudo pacman -S xf86-video-intel fakeroot
```

### NVIDIA graphics driver

Get graphics informations: `lspci -k | grep -A 2 -E "(VGA|3D)"`

For `GeForce GT 620`: install the AUR package: `nvidia-340xx-dkms`.

```
yay -S nvidia-390xx-drm  nvidia-390xx-utils
doas pacman -S mesa xf86-video-intel
nvidia-xconfig
```

Get the display size with `xrandr` add `DisplaySize 280 160` to
`/etc/X11/xorg.conf` in the `Monitor` section and comment every other fields
exept `Identifier`.

Add `BusID "PCI:1:0:0"` in the `Device` block in `/etc/X11/xorg.conf`.

### Suckless

`git clone https://github.com/CourrierGui/suckless ~/softwares/suckless`

**slock:** [wiki page](https://wiki.archlinux.org/index.php/Slock)

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

**Powerline fonts**:

`yay -S powerline-fonts-git`

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
create /etc/X11/Xwrapper.config
allowed_users=anybody
needs_root_rights=yes
```

## Sound

```
sudo pacman -S pulseaudio-alsa pamixer
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
sudo pacman -S neovim ctags nodejs npm clang xclip
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

## Android tethering

Find the vendor id of the device: `# udevadm info /sys/class/net/<interface>`

Create the `udev` rule in `/etc/udev/rules.d/90-android-tethering.rules`:
```
# Execute pairing program when appropriate
ACTION=="add|remove", SUBSYSTEM=="net", ATTR{<vendor id>}=="18d1" ENV{ID_USB_DRIVER}=="rndis_host", SYMLINK+="android", RUN+="/usr/bin/systemctl restart systemd-networkd.service"
```

Then create the corresponding `systemd-networkd` file `/etc/systemd/network/50-<interface>.network`:

```
[Match]
Name=<interface>

[Network]
DHCP=ipv4
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

Find files which could break:
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
sudo pacman -S libnotify dunst
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

## Virtualization

```
LC_ALL=C lscpu | grep Virtualization
```

## Printer

```
sudo pacman -S cups cups-pdf avahi nss-mdns python-dbus python-gobject

systemctl enable cups.service
systemctl start cups.service
systemctl enable avahi-daemon.service ?
systemctl start avahi-daemon.service ?
```

If not working, enable and start `cups` service.

Add: `mdns_minimal [NOTFOUND=return]` to `/etc/nsswitch.conf` at line `hosts:` before `resolve`.

### Printer setup

1. `$ avahi-browse --all -t -r`: find the IP address of the Printer
2. `lpinfo --make-and-model '<printer type>' -m`: gives the <driver> of the printer
3. `# lpadmin -E -p <name> -v socket://<IP> -m <driver>`
4. `# lpadmin -d <name>`: make this printer default
5. `# cupsenable <name>`
6. `# cupsaccept <name>`

```
lpr # print
lpq # see print queue
```

## More packages

### Standard repos

```
sudo pacman -S python-pip htop tree cmake thunderbird thunderbird-i18n-fr \
    doxygen graphviz wget usbutils mupdf automake autoconf valgrind xf86-input-wacom \
    recordmydesktop python-matplotlib gtop scrot sxiv tmux gnuplot mpv youtube-dl \
    newsboat ttf-linux-libertine adobe-source-code-pro-fonts
```

### AUR

```
yay -S pfetch task-spooler lf brave-bin powerline-fonts-git
```

### Pip

```
pip install numpy matplotlib
```

### C++ libraries

**pacman:** boost glfw-x11 glm freetype2 assimp vsqlite++ cpptoml

**AUR:** libcurlpp

### ROS

```
yay -S ros-melodic-ros-base ros-melodic-pcl-ros ros-melodic-pcl-conversions ros-melodic-pcl-msgs
```

### Fonts

**pacman:** ttf-ubuntu-font-family ttf-proggy-font

**AUR:** gohu-ttf ttf-gaegu nerd-fonts-droid-sans-mono

# Install script

```
su root
echo "permit persist guillaume as root" >> /etc/doas.conf
echo "guillaume ALL=(ALL) ALL" >> /etc/sudoers
exit
```

```
doas systemctl enable NetworkManager.service
doas systemctl start NetworkManager.service
nmcli device wifi connect "ssid" -a
timedatectl set-ntp true
```

```
mkdir -p ~/.config
curl -o ~/.config/post-install.sh https://raw.githubusercontent.com/CourrierGui/archconfig/master/.config/post-install.sh
chmod u+x ~/.config/post-install.sh
./.config/post-install.sh
```

Logout to update .zprofile and don't forget to install libxft-bgra

## Backup

### Pacman

* list of packages: `pacman -Qqe > packages.txt`
* `-t`: do not list dependencies
* `-n`: ignore foreign packages (not AUR)
* `comm -13 <(pacman -Qqdt | sort) <(pacman -Qqdtt | sort) > optdeplist.txt`:
  list of optionnal dependencies, installed with `--asdeps`
* `pacman -Qqem > foreignpkg.txt`: list of AUR packages and other foreign
  packages


## Multiple monitors

- `xrandr`: list available monitors
- `xrandr --output DP1 --auto --same-as eDP1 --mode 1920x1080`:
  both monitors will display the same output
- `xrandr --output DP1 --auto --right-of eDP1`:
  use two independant monitors
