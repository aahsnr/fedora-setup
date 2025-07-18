#!/bin/sh

cd && git clone https://github.com/aahsnr/dotfiles $HOME/.dots
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# sudo dnf config-manager --enable fedora-cisco-openh264

sudo dnf copr enable atim/lazygit
sudo dnf copr enable atim/starship
sudo dnf copr enable solopasha/hyprland
sudo dnf copr enable sneexy/zen-browser
sudo dnf copr enable lukenukem/asus-linux
sudo dnf update

sudo dnf install -y dnf-automatic cargo copr-selinux dnf-plugins-core fedora-workstation-repositories flatpak gtkmm3.0-devel gnome-keyring gsettings-desktop-schemas-devel libxcb gtk3-devel gtk4-devel xcur2png kernel kernel-core kernel-devel kernel-devel-matched kernel-modules kernel-modules-core kernel-modules-extra nodejs npm pipx pixman plymouth-theme-spinner polkit-devel mate-polkit python3-devel python3-wheel python3-build python3-installer python3-setuptools atuin util-linux-user fzf fd-find poppler-utils ripgrep ffmpegthumbnailer mediainfo ImageMagick tar unzip autojump-zsh starship zoxide zsh zsh-autosuggestions zsh-lovers zsh-syntax-highlighting aide arpwatch chrony cronie curl fail2ban fdupes eza lynis PackageKit-command-not-found p7zip powertop psacct rng-tools sysstat wget neovim python3-neovim tree-sitter wl-clipboard alacritty deluge emacs file-roller zen-browser ranger thunar thunar-volman thunar-media-tags-plugin thunar-archive-plugin tumbler kitty zathura zathura-zsh-completion zathura-pdf-poppler kvantum papirus-icon-theme qt5ct qt6ct gnome-themes-extra gtk-murrine-engine sassc vulkan xorg-x11-drv-nvidia-cuda-libs nvidia-vaapi-driver libva-utils vdpauinfo autoconf automake binutils bison ccache cmake ctags elfutils flex go gcc gcc-c++ gdb glibc-devel libtool make perf pkgconf strace valgrind gettext git-core git-credential-libsecret highlight lazygit meld meson ninja-build subversion abrt-desktop setroubleshoot system-config-language alsa-utils pavucontrol pamixer pipewire pipewire-alsa pipewire-gstreamer pipewire-pulseaudio pipewire-utils pulseaudio-utils wireplumber redhat-rpm-config rpm-build koji mock rpmdevtools pungi rpmlint shfmt cliphist nwg-clipman egl-wayland greetd pam-devel grim hyprcursor hypridle hyprland hyprland-devel hyprland-contrib hyprlang hyprnome hyprpaper hyprpicker hyprwayland-scanner pyprland qt5-qtwayland qt6-qtwayland slurp swaylock-effects tomlplusplus wayland-protocols-devel xisxwayland xdg-desktop-portal-gtk xdg-desktop-portal-hyprland xorg-x11-server-Xwayland xorg-x11-server-Xwayland-devel wf-recorder asusctl power-profiles-daemon supergfxctl asusctl-rog-gui gtk4 gtk4-layer-shell gjs NetworkManager bluez --allowerasing

curl -fsSL https://bun.sh/install | bash

sudo systemctl enable supergfxd.service power-profiles-daemon

echo "@fonts"
sudo mkdir -p /usr/local/share/fonts/nerd
sudo cp $HOME/.dots/.fonts/* /usr/local/share/fonts/nerd/
sudo chown -R root: /usr/local/share/fonts/nerd
sudo chmod 644 /usr/local/share/fonts/nerd/*
#sudo restorecon -vFr /usr/local/share/fonts/nerd
sudo fc-cache -v

ln -s $HOME/.dots/.config/nvim-astronvim/ $HOME/.config/nvim

sudo systemctl set-default graphical.target
systemctl --user enable --now wireplumber.service pipewire-pulse.socket pipewire.socket pipewire-pulse.service pipewire.service pipewire-pulse.socket pipewire.socket pipewire-pulse.service pipewire.service

cd && mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

sudo cp -R ~/.dots/variables.sh /etc/profile.d/
git config --global user.name "aahsnr"
git config --global user.email "ahsanur041@proton.me"
git config --global credential.helper /usr/libexec/git-core/git-credential-libsecret

sudo dnf mark user akmod-nvidia
