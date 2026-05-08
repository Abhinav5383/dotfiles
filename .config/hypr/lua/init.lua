hl.on("hyprland.start", function ()
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("swayosd-server -s ~/.config/swayosd/style.css")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("~/.config/hypr/scripts/on-low-battery.sh")

  -- gtk theme
  hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"catppuccin-mocha-mauve-standard+default\"")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme \"macOS-White\"")
end)


-- Wayland THings
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")


-- Theme Stuff
hl.env("GTK_THEME", "catppuccin-mocha-mauve-standard+default")

hl.env("XCURSOR_THEME", "macOS-White")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "macOS-White")
hl.env("HYPRCURSOR_SIZE", "24")

