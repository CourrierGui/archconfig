# Complete installation of Artix Linux with runit

## Bootable USB

Download iso and signature at [artix](https://artixlinux.org/download.php)

Check signature: `gpg --auto-key-retrieve --verify name.iso.sig name.iso
`
Install artix on USB: `sudo dd bs=4M if=path_to_arch_iso of=/dev/sdx status=progress oflag=sync`

## Partitions

```
cfdisk /dev/sda
```

## Packages

networkmanager-runit

## Install script

* issue with reflector
* add update before install (alltough it was not necessary)
* remove dmenu, task
* add gcr, webkit2gkt -> surf compilation
* coc-vimtex install issue
* remove zsh config
* /etc folder
* chsh for user too
* amixer -> add alsa-utils to package list
* missing key for libxft-bgra
* ubuntu fonts
* internet script not working
