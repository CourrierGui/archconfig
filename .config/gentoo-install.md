# Gentoo Installation

Gentoo installation guide:
[AMD64](https://wiki.gentoo.org/wiki/Handbook:AMD64)

[Download](https://www.gentoo.org/downloads/) the Gentoo image: 

Install the disk image on a usb stick (on `/dev/sdb`):

```
sudo dd bs=4M if=path/to/iso of=/dev/sdb status=progress oflags=sync
```

See `wpa_supplicant` configuration in `arch-install.md` for network connection.

## Emerge

* dhcpcd
* wpa_supplicant
* sys-apps/usbutils
* app-admin/sudo

# Xorg

[Wiki](https://wiki.gentoo.org/wiki/Xorg)

* x11-base/xorg-server
* x11-base/xorg-x11

## Shutdown

* `# shutdown -h now`
* if emerge is running: ctrl-z + `fg; shutdown -h now`
* if you want to emerge before: `emerge ... && shutdown -h now`
