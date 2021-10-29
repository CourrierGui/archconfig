# Complete installation of Artix Linux with runit

## Bootable USB

Download iso and signature at [artix](https://artixlinux.org/download.php)

Check signature: `gpg --auto-key-retrieve --verify name.iso.sig name.iso
`
Install artix on USB: `sudo dd bs=4M if=path_to_arch_iso of=/dev/sdx status=progress oflag=sync`

## Internet USB connection

```
$ ip link
-> should display usb0 or equivalent
# dhcpcd usb0
```

## Partitions

```
cfdisk /dev/sda
```

```
basestrap /mnt base base-devel runit elogind-runit
basestrap /mnt linux linux-firmware
fstabgen -U /mnt >> /mnt/etc/fstab
```

## Basic Setup

```
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc
echo "KEYMAP=fr-latin1" >> /etc/vconsole.conf
echo "LANG=fr_FR.UTF-8" >> /etc/locale.conf
echo "hostname" >> /etc/hostname

pacman -S neovim opendoas dhcpcd
passwd
useradd -m guillaume
passwd guillaume

exit
umount -R /mnt
reboot
```

## Suckless

```
lspci -v | grep -A1 -e VGA -e 3D
pacman -S xf86-video-nouveau xorg-server xorg-apps git meson zsh xorg-xinit
pacman -Rs sudo

mkdir -p ~/dev/clone
cd ~/dev/clone
git clone https://aur.archlinux.org/libxft-bgra.git
cd libxft-bgra
makepkg -si

mkdir -p ~/dev/projects
cd ~/dev/projects
git clone https://github.com/CourrierGui/suckless
cd suckless
meson setup build
meson compile -C build
ninja -C build install

cd ~
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
git clone --bare git@github.com:CourrierGui/archconfig.git $HOME/.cfg
config checkout -f
config config --local status.showUntrackedFiles no

chsh -s /usr/bin/zsh
doas chsh -s /usr/bin/zsh

mkdir ~/.config/dwm
touch ~/.config/dwm/log.txt
pacman -S adobe-source-code-pro-fonts

cd ~/dev/clone
git clone https://aur.archlinux.org/brave-bin.org
git clone https://aur.archlinux.org/pfetch.org
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.config/zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.config/zsh/plugins/
doas pacman -S fzf

pacman -S python-pip
doas pip install neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
pacman -S nodejs npm
nvim
:PlugInstall
:q
nvim # install Coc extensions

pacman -S feh keepassxc ctags
feh --bg-scale ~/.config/wall.png
git clone https://gitea.artixlinux.org/nous/artix-backgrounds-extra.git

git clone https://aur.archlinux.org/picom-jonaburg-git.git
git clone https://gitlab.freedesktop.org/xorg/app/xbacklight.git
cd xbacklight && sh autogen.sh && make && cp xbacklight ~/.local/bin

cat /etc/X11/xorg.conf.d/20-intel.conf
Section "Device"
    Identifier "Intel Graphics"
    Driver     "intel"
    Option     "Backlight" "intel_backlight"
EndSection

doas libinput list-devices
cat /etc/X11/xorg.conf.d/30-touchpad.conf
Section "InputClass"
    Identifier "/dev/input/event12" --> touchpad device
    Driver "libinput"
    Option "Tapping" "on"
    Option "ClickMethod" "clickfinger"
    Option "NaturalScrolling" "true"
    Option "ScrollMethod" "twofinger"
EndSection

pacman -S man-db man-pages alsa-utils
pacman -S libnotify dunst

pacman -S openssh xf86-video-intel
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

pacman -S tmux mupdf clang meson

# Pangolin
pacman -S cmake assimp glm doxygen gtest gdb hwinfo
git clone https://aur.archlinux.org/glfw-git.git
doas pip install sphinx sphinx_rtd_theme breathe

pacman -S mpv youtube-dl
pacman -S lsscsi

pangolin
wayland
haskell
julia
make clean automatique avant une backup

Wayland:
pacman -S seatd wlroots

micro
microcode
thunderbird
```

surf, dmenu_run, ubuntu font sur st
modifier et setbg .xprofile pour utiliser feh

Problème de dépendance `X11` avec meson: `dependency('x11', ...)`.
`common/utils.c`: `#include "sl-utils.h"`

## Packages

networkmanager-runit

## Install script

* issue with reflector (Artix)
* add update before install (altough it was not necessary)
* remove dmenu
* add gcr, webkit2gkt -> surf compilation
* coc-vimtex install issue
* remove zsh config
* /etc folder
* chsh for user too
* amixer -> add alsa-utils to package list
* missing key for libxft-bgra
* ubuntu fonts
* internet script not working

# Hardware information

* `# hwinfo --framebuffer`

# Grub customization

## Background image

`GRUB_BACKGROUND="/boot/grub/image"`: support png, jpeg and tga

## Screen size

`GRUB_GFXMODE=1920x1080x32,1280x1024x32,auto`

## Theme

`GRUB_THEME="/path/to/theme.txt"`

## NTP

```
# pacman -S ntp ntp-runit
# ntpd -qg
```
