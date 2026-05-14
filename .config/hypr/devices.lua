-- monitor
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "1.2"
})


-- Input devices
hl.config({
  input = {
    follow_mouse = 1,
    follow_mouse_threshold = 3,
    sensitivity = 1,
    accel_profile = "custom 0.1315929378 0.000 0.070 0.140 0.229 0.334 0.439 0.544 0.649 0.802 0.962 1.122 1.281 1.441 1.601 1.760 1.920 2.080 2.239 2.399 2.559 2.718 2.878 3.038 3.367",
    repeat_rate = 25,
    repeat_delay = 250,

    touchpad = {
      natural_scroll = true
    }
  },

  gestures = {
    workspace_swipe_distance = 200
  }
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})
