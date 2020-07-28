pacman_packages="/tmp/pacman"
aur_packages="/tmp/aur"
pip_packages="/tmp/pip"
user="guillaume"

installpkg() { pacman --noconfirm --needed -S "$1" >/dev/null 2>&1 ;}
yayinstall() { yay -S --noconfirm "$1" >/dev/null 2>&1 ;}
error() { clear; printf "ERROR: %s\\n" "$1"; exit;}

start() {
	dialog --colors --title "Archlinux installation" \
		--yes-label "Yes" --no-label "Cancel" \
		--yesno "You have to be root to continue.\nDo you want to proceed to the installation ?" 0 0
}

download_package_lists() {
	curl -o /tmp/pacman.txt "https://raw.githubusercontent.com/CourrierGui/archconfig/master/.config/packages/pacman-packages.txt"
	curl -o /tmp/aur.txt "https://raw.githubusercontent.com/CourrierGui/archconfig/master/.config/packages/aur-packages.txt"
	curl -o /tmp/pip.txt "https://raw.githubusercontent.com/CourrierGui/archconfig/master/.config/packages/pip-packages.txt"
}

setup_network () {
	dialog --colors --title "Setup internet connection" \
		--yes-label "Yes" --no-label "No" \
		--yesno "Do you want to setup your wifi connection ?" 0 0
	interface=$(dialog --stdout --menu "Setup internet connection" 10 30 8 $(ip -o addr | awk '{split($4, a, "/"); print $2" "a[1]}'))
	ip link set $interface up
	dialog --infobox "The interface is $interface" 0 0
	ssid=$(dialog --stdout --menu "Setup internet connection" 10 30 8 $(nmcli device wifi list | awk '!/BSSID|--|^$/ { print $2 }'))
	dialog --infobox "The interface is $ssid" 0 0
}

install_yay() {
	git clone https://aur.archlinux.org/yay.git ~/softwares/aur/yay
	cd ~/softwares/aur/yay
	makepkg -si
}

install_config() {
	alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
	echo ".cfg" >> .gitignore
	git clone --bare https://github.com/CourrierGui/archconfig $HOME/.cfg
	config checkout
	config config --local status.showUntrackedFiles no
}

install_pacman() {
	echo "Installing pacman packages..."
	doas pacman -S --needed - < "$1"
	echo "Done."
}

install_aur() {
	echo "Installing AUR packages..."
	while read pkg; do
		yay -S --noconfirm "$pkg" >/dev/null 2>&1
	done < "$1"
	echo "Done."
}

install_pip() {
	echo "Installing pip packages..."
	while read pkg; do
		yes | pip install $pkg >/dev/null 2>&1
	done < "$1"
	echo "Done."
}

install_suckless() {
	echo "Installing Suckless softwares..."
	git clone https://github.com/CourrierGui/suckless ~/softwares/suckless
	cd ~/softwares/suckless/dwm-6.2; doas make install && make clean
	cd ../st; doas make install && make clean
	cd ../dwmblocks; doas make install && make clean
	cd ../surf; doas make install && make clean
	doas printf "allower_users=anybody\\nneeds_root=yes" > /etc/X11/Xwrapper.conf
	echo "Done."
}

neovim_config() {
	echo "Configuring Neovim..."
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	nvim --headless +PlugInstall +qa
	echo "Done."
}

zsh_config() {
	echo "Configuring zsh..."
	chsh -s /usr/bin/zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten
	ln -s "$ZSH_CUSTOM/themes/typewritten/typewritten.zsh-theme" "$ZSH_CUSTOM/themes/typewritten.zsh-theme"
	wget https://raw.githubusercontent.com/dikiaap/dotfiles/master/.oh-my-zsh/themes/oxide.zsh-theme
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/skylerlee/zeta-zsh-theme/master/scripts/install.sh)"
	wget -O ~/.oh-my-zsh/themes/nothing.zsh-theme https://raw.githubusercontent.com/eendroroy/nothing/master/nothing.zsh
	echo "Done."
}

touchpad() {
	printf "Section \"InputClass\"\\n\tIdentifier \"touchpad catchall\"\\n\tDriver \"libinput\"\\n\tOption \"Tapping\" \"on\"\\nEndSection" > /etc/X11/xorg.conf.d/30-touchpad.conf
}

# start || error "Installation interrupted"
# setup_network || error "Installation interrupted"

echo "Installaion started!"
echo "Updating mirrorlist..."
doas cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup
doas reflector --latest 100 --sort rate --save /etc/pacman.d/mirrorlist && rm /etc/pacman.d/mirrorlist-backup
echo "Done."

download_package_lists
install_yay || error "Installation interrupted"
install_config
install_pacman $pacman_packages || error "Installation interrupted"
install_aur $aur_packages || error "Installation interrupted"
install_pip $pip_packages || error "Installation interrupted"

install_suckless
neovim_config
zsh_config
touchpad

clear
echo "Installation finished!"
