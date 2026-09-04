export PATH="$HOME/.local/bin:$HOME/go/bin:$HOME/portable-bin:$HOME/.cache/.bun/bin:$PATH"

export GTK_USE_PORTAL=1
export ELECTRON_OZONE_PLATFORM_HINT=wayland

# Misc
export EDITOR=helix
export ANV_DEBUG="video-decode,video-encode"
export TERM="xterm-256color"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --strip-cwd-prefix"

# man-pager
export MANROFFOPT='-c'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# XDG vars for common directories
export XDG_MENU_PREFIX="arch-"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIR="$HOME/.local/share"

export XDG_VIDEO_DIR="$HOME/Videos"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"


# difft config
export DFT_IGNORE_COMMENTS="true"
export DFT_DISPLAY="inline"
