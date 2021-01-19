# TODO

* sound
* xwallpaper

Gentoo installation guide:
[AMD64](https://wiki.gentoo.org/wiki/Handbook:AMD64)

[Download](https://www.gentoo.org/downloads/) the Gentoo image: 

Install the disk image on a usb stick (on `/dev/sdb`):

```
sudo dd bs=4M if=path/to/iso of=/dev/sdb status=progress oflags=sync
```

See `wpa_supplicant` configuration in `arch-install.md` for network connection.

# Emerge

* net-misc/dhcpcd
* wpa_supplicant
* sys-apps/usbutils
* app-admin/sudo
* dev-vcs/git
* clang
* nvim

# Xorg

## Nouveau drivers

## elogind

`# rc-update add elogind boot`

[Wiki](https://wiki.gentoo.org/wiki/Xorg)

* x11-base/xorg-server
* x11-base/xorg-x11
* xorg-xinit
* xorg-xev
* xf86-video-intel

## Shutdown

* `# shutdown -h now`
* if emerge is running: ctrl-z + `fg; shutdown -h now`
* if you want to emerge before: `emerge ... && shutdown -h now`

# Suckless

## libxft-bgra

```
$ git clone https://github.com/uditkarode/libxft-bgra
$ cd libxft-bgra
# make libdir=/usr/lib64 install
```

## dmenu

## dwm

* libxinerama
* ttf-joypixels
* libxcb

## dwmblocks

## st

* powerline-fonts-git
* x11-misc/xcompmgr

## surf

* app-crypt/gcr
* net-libs/webkit-gtk

## Zsh

* `# emerge --ask app-shells/zsh`
* `chsh guillaume -s /bin/zsh`

### pfetch

```
git clone https://github.com/dylanaraps/pfetch.git
cd pfetch
cp pfetch ~/.local/bin/pfetch
```

### fzf

```
# emerge --ask app-shells/fzf
# emerge --ask --autounmask "=fzf-<version>"
# dispatch-conf
# emerge --ask "=fzf-<version>"
```

## Neovim

* net-libs/nodejs
* sys-apps/ripgrep
* clangd
* powerline fonts: see arch-install.md

## Tools

* x11-misc/xwallpaper
* x11-misc/dunst
* remove battery script
* htop
* app-shells/fzf
* www-client/firefox-bin

# Fonts

* media-fonts/ubuntu-font-family
* media-fonts/noto-emoji
