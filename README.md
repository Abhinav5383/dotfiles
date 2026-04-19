# Hyprland dotfiles

NOTE FOR MYSELF: add the `options snd_soc_sof_es8336 quirk=128` kernel parameter to make sound work. (`/etc/modprobe.d/speaker-fix.conf`)

# Fonts

- [Space Grotesk](https://fonts.google.com/specimen/Space+Grotesk)

# Packages

## Base packages

7zip
alsa-utils
base
base-devel
bat
blueman
bluez
bluez-utils
brightnessctl
chaotic-keyring
chaotic-mirrorlist
clang
dosfstools
efibootmgr
eza
fd
fzf
gdb
git
github-cli
gnome-keyring
gst-plugin-pipewire
gtk2
gtk4
gvfs-mtp
hypridle
hyprland
hyprlock
hyprpaper
hyprpicker
hyprpolkitagent
intel-gpu-tools
intel-media-driver
intel-ucode
iwd
kitty
kvantum
kvantum-qt5
less
libpulse
libva-utils
linux
linux-firmware-intel
linux-firmware-other
linux-firmware-whence
linux-headers
networkmanager
noto-color-emoji-fontconfig
noto-fonts-cjk
noto-fonts-emoji
noto-fonts-extra
nwg-look
otf-monaspace-nerdfonts
pipewire
pipewire-alsa
pipewire-jack
pipewire-pulse
playerctl
qt5-wayland
qt5ct
qt6-wayland
qt6ct-kde
rust
satty
sof-firmware
starship
stow
swaync
swayosd
ttf-jetbrains-mono-nerd
ttf-material-design-icons-extended
ttf-nerd-fonts-symbols-mono
udiskie
vpl-gpu-rt
vulkan-headers
vulkan-intel
wireplumber
wl-clipboard
woff2-font-awesome
xdg-desktop-portal-gtk
xdg-desktop-portal-hyprland
yay
yazi
zram-generator
zsh


## Extras

atuin
brave-bin
btop
bun-bin
chromium
fastfetch
flatpak
go
grim
gthumb
heroic-games-launcher-bin
jdk24-openjdk
man-db
man-pages
nautilus
ncdu
pavucontrol
pm2
python-pillow
qbittorrent
reflector
rsync
slurp
stremio
tesseract
tesseract-data-eng
tldr
vicinae
valkey
visual-studio-code-bin
yt-dlp
zed

## VLC Stuff
vlc
vlc-plugin-ffmpeg
vlc-plugin-freetype
vlc-plugin-matroska
vlc-plugin-mtp
vlc-plugin-srt
vlc-plugin-x264
vlc-plugin-x265

## AUR
apple_cursor
catppuccin-gtk-theme-mocha
wl-screenrec


## helix setup
helix

- **HTML** \
    vscode-html-languageserver
    emmet-language-server

- **CSS** \
    vscode-css-languageserver
    tailwind-language-server

- **TypeScript** \
    biome
    typescript
    typescript-language-server


## Speaker fix

1. create a symlink to the dkms folder in `/usr/src` folder
```sh
sudo ln -s /home/abhinav/dotfiles/dkms/es8336-fix /usr/src/sof-es8336-1.0
```

2. Add the module
```sh
sudo dkms add -m sof-es8336 -v 1.0
```

3. build and install
```sh
sudo dkms build -v 1.0 -m sof-es8336
sudo dkms install -v 1.0 -m sof-es8336
```

4. Add the driver "quirk"
`/etc/modprobe.d/speaker-fix.conf`
```sh
options snd_soc_sof_es8336 quirk=128
```
