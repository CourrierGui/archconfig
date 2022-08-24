pacman_packages="/tmp/pacman.txt"
aur_packages="/tmp/aur.txt"
pip_packages="/tmp/pip.txt"
user="guillaume"

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

start()
{
    dialog --colors --title "Archlinux installation" \
        --yes-label "Yes" --no-label "Cancel" \
        --yesno "You have to be root to continue.\nDo you want to proceed to the installation ?" 0 0
}

update()
{
    echo "System update..."
    doas pacman -Syyu >/dev/null 2>&1 || error "Error while updating system."
    echo "Done."
}

download_package_lists()
{
    curl -o $pacman_packages "https://raw.githubusercontent.com/CourrierGui/archconfig/master/.config/packages/pacman.txt"
    curl -o $aur_packages "https://raw.githubusercontent.com/CourrierGui/archconfig/master/.config/packages/aur.txt"
    curl -o $pip_packages "https://raw.githubusercontent.com/CourrierGui/archconfig/master/.config/packages/pip.txt"
}

setup_network()
{
    dialog --colors --title "Setup internet connection" \
        --yes-label "Yes" --no-label "No" \
        --yesno "Do you want to setup your wifi connection ?" 0 0

    interface=$(dialog --stdout --menu "Setup internet connection" 10 30 8 $(ip -o addr | awk '{split($4, a, "/"); print $2" "a[1]}'))
    ip link set $interface up
    dialog --infobox "The interface is $interface" 0 0
    ssid=$(dialog --stdout --menu "Setup internet connection" 10 30 8 $(nmcli device wifi list | awk '!/BSSID|--|^$/ { print $2 }'))
    dialog --infobox "The interface is $ssid" 0 0
}

install_yay()
{
    git clone https://aur.archlinux.org/yay.git ~/softwares/aur/yay
    cd ~/softwares/aur/yay
    makepkg -si
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
        echo $pkg
        installpkg $pkg || printf "error"
    done < "$1"
    echo "Done."
}

install_aur()
{
    echo "Installing AUR packages..."
    while read pkg; do
        echo $pkg
        yayinstall "$pkg" || printf "error"
    done < "$1"
    echo "Done."
}

install_pip()
{
    echo "Installing pip packages..."
    while read pkg; do
        echo $pkg
        pipinstall $pkg || printf "error"
    done < "$1"
    echo "Done."
}

meson_install()
{
    meson setup build
    ninja -C build
    sudo ninja -C build install
    ninja -C build clean
}

install_suckless()
{
    echo "Installing Suckless softwares..."
    git clone https://github.com/CourrierGui/suckless ~/softwares/suckless
    cd ~/softwares/suckless && meson_install
    doas sh -c 'printf "allowed_users=anybody\\nneeds_root_rights=yes" > /etc/X11/Xwrapper.conf'
    echo "Done."
}

neovim_config()
{
    echo "Configuring Neovim..."
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    nvim --headless +PlugInstall +qa
    echo "Done."
}

zsh_config()
{
    echo "Configuring zsh..."
    doas chsh -s /usr/bin/zsh
    chsh -s /usr/bin/zsh
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
}

setup_mirrors()
{
    echo "Updating mirrorlist..."
    doas cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup
    doas reflector --latest 100 --sort rate --save /etc/pacman.d/mirrorlist && rm /etc/pacman.d/mirrorlist-backup
    echo "Done."
}

start || error "Installation interrupted"
setup_network || error "Installation interrupted"

echo "Installation started!"

setup_mirrors || error "Error while setting up mirrors."
 
download_package_lists || error "Error while downloading package lists."
install_yay || error "Error while installing yay."
install_config || error "Error while installing config files."
install_pacman $pacman_packages || error "Error while installing packages via pacman."
install_aur $aur_packages || error "Error while installing AUR packages."
install_pip $pip_packages || error "Error while installing packages via pip."

install_suckless || error "Error while compiling/installing suckless utilities."
neovim_config || error "Error while configuring Neovim."
zsh_config || error "Error while configuring ZSH."
final_touch || error "Error while finalizing installation."

echo "Installation finished!"
