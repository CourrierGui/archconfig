pacman_packages=/tmp/pacman.txt
aur_packages=/tmp/aur.txt
pip_packages=/tmp/pip.txt
user=guillaume

installpkg()
{
    sudo pacman --asdeps --noconfirm --needed -S "$1"
}

yayinstall()
{
    yay -S --noconfirm "$1";
}

pipinstall()
{
    yes | pip install $pkg;
}

error()
{
    rc=$?
    echo "error: $@"
    exit $rc
}

update()
{
    echo "System update..."
    sudo pacman -Syyu >/dev/null 2>&1 || error "Error while updating system."
    echo "Done."
}

download_package_lists()
{
    curl -o "$pacman_packages" "https://raw.githubusercontent.com/CourrierGui/archconfig/master/.config/packages/pacman.txt"
    curl -o "$aur_packages" "https://raw.githubusercontent.com/CourrierGui/archconfig/master/.config/packages/aur.txt"
    curl -o "$pip_packages" "https://raw.githubusercontent.com/CourrierGui/archconfig/master/.config/packages/pip.txt"
}

install_yay()
{
    if [[ ! -d "~/softwares/aur/yay" ]] && ! command -v yay
    then
        git clone https://aur.archlinux.org/yay.git ~/softwares/aur/yay
        cd ~/softwares/aur/yay
        makepkg -si
    fi
}

install_config()
{
    echo ".cfg" >> .gitignore
    git clone --bare https://github.com/CourrierGui/archconfig $HOME/.cfg
    /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout -f
    /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME config --local status.showUntrackedFiles no
}

install_pacman()
{
    echo "Installing pacman packages..."
    while read pkg; do
        installpkg $pkg || error "pacman: failed to install $pkg"
    done < "$1"
    echo "Done."
}

install_aur()
{
    echo "Installing AUR packages..."
    while read pkg; do
        echo $pkg
        yayinstall "$pkg" || error "yay: failed to install $pkg"
    done < "$1"
    echo "Done."
}

install_pip()
{
    echo "Installing pip packages..."
    while read pkg; do
        echo $pkg
        pipinstall $pkg || error "pip: failed to install $pkg"
    done < "$1"
    echo "Done."
}

meson_install()
{
    meson setup build --prefix /usr
    ninja -C build
    sudo ninja -C build install
}

install_suckless()
{
    if ! command -v dwm
    then
        echo "Installing Suckless softwares..."
        git clone https://github.com/CourrierGui/suckless ~/softwares/suckless
        cd ~/softwares/suckless && meson_install
        sudo sh -c 'printf "allowed_users=anybody\\nneeds_root_rights=yes\n" > /etc/X11/Xwrapper.conf'
    fi
}

zsh_config()
{
    echo "Configuring zsh..."
    sudo chsh -s /usr/bin/zsh
    chsh -s /usr/bin/zsh

    cd ~/.config/zsh/plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    cd -

    echo "Done."
}

final_touch()
{
    config=$(cat <<<EOF
Section "InputClass"
    Identifier "touchpad catchall"
    Driver "libinput"
    Option "Tapping" "on"
EndSection
    EOF)
    sudo sh -c "echo '$config' > /etc/X11/xorg.conf.d/30-touchpad.conf"

    mkdir -p .config/dwm
    mkdir -p .config/nvim/sessions
    touch .config/dwm/log.txt
    mkdir ~/{Documents,Pictures,Videos,Music,dev,Downloads}
}

echo "Installation started!"

sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager
sudo timedatectl set-ntp true
sudo sed -i 's|#\W\(%wheel ALL=(ALL:ALL)\WALL$\)|\1, NOPASSWD: /usr/bin/reboot, /usr/bin/shutdown|' /etc/sudoers

download_package_lists || error "Error while downloading package lists."
install_yay || error "Error while installing yay."
install_config || error "Error while installing config files."
install_pacman $pacman_packages || error "Error while installing packages via pacman."
install_aur $aur_packages || error "Error while installing AUR packages."
install_pip $pip_packages || error "Error while installing packages via pip."

install_suckless || error "Error while compiling/installing suckless utilities."
zsh_config || error "Error while configuring ZSH."
final_touch || error "Error while finalizing installation."

echo "Installation finished!"
