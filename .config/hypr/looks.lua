hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 0,
    border_size = 1,

    col = {
      active_border = "rgba(B4BEFEFF)",
      inactive_border = "rgba(585B70FF)"
    },
    resize_on_border = true,
    allow_tearing = false,

    layout = "dwindle"
  },

  decoration = {
    shadow = {
      enabled = false
    },
    blur = {
      enabled = false
    },
    rounding = 0
  },

  animations = {
    enabled = false
  },

  dwindle = {
    preserve_split = true
  },

  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true
  },

  xwayland = {
    force_zero_scaling = true
  }
})


-- Smart Gaps
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
  match = { float = false, workspace = "w[tv1]" },
  border_size = 0
})
hl.window_rule({
  match = { float = false, workspace = "w[tv1]" },
  rounding = 0
})
hl.window_rule({
  match = { float = false, workspace = "f[1]" },
  border_size = 0
})
hl.window_rule({
  match = { float = false, workspace = "f[1]" },
  rounding = 0
})


-- Scrolling Layout in the special workspace
hl.workspace_rule({
  workspace = "s[true]",
  layout = "scrolling"
})

hl.config({
  scrolling = {
    column_width = 0.9
  }
})


-- Window Rules
hl.window_rule({
  match = { class = ".*" },
  suppress_event = "maximize"
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})


-- Custom window sizings
hl.window_rule({
  match = { class = "(xdg-desktop-portal-gtk|hyprland-share-picker)" },
  float = true,
  center = true,
  size = { "monitor_w * 0.7", "monitor_h * 0.7" }
})

hl.window_rule({
  match = { class = "xdg-desktop-portal-gtk" },
  float = true,
  center = true,
  size = { "monitor_w * 0.75", "monitor_h * 0.75" }
})

hl.window_rule({
  match = { class = "(org.gnome.gThumb|com.gabm.satty)" },
  float = true,
  center = true,
  size = { "monitor_w * 0.97", "monitor_h * 0.97" }
})


hl.window_rule({
  match = { title = "(^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$)" },
  float = true,
  pin = true,
  keep_aspect_ratio = true,
  size = { "monitor_w * 0.25", "monitor_h * 0.25" },
  move = { "(monitor_w * 0.75) - 16", "(monitor_h * 0.75) - 16" }
})

