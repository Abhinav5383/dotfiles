# Add user configurations here
# For HyDE to not touch your beloved configurations,
# we added 2 files to the project structure:
# 1. ~/.hyde.zshrc - for customizing the shell related hyde configurations
# 2. ~/.zshenv - for updating the zsh environment variables handled by HyDE // this will be modified across updates

#  Plugins 
# oh-my-zsh plugins are loaded  in ~/.hyde.zshrc file, see the file for more information

#  Aliases 
# Add aliases here

#  This is your file 
# Add your configurations here

# bun
export BUN_INSTALL="$HOME/.bun"

export PATH="$BUN_INSTALL/bin:/home/abhinav/go/bin:/home/abhinav/.local/bin:/home/abhinav/.cargo/bin:$PATH"
export JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
export EDITOR=helix

eval "$(atuin init zsh)"

# IBUS cofig
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS='@im=ibus'
export TERM='xterm-256color'
export VDPAU_DRIVER='va_gl'
export LIBVA_DRIVER_NAME='iHD'
# export BRAVE_FLAGS=$(cat ~/.config/chromium-flags.conf)
export BAT_THEME="Dracula"


