local wezterm = require 'wezterm'
return {
  window_padding = {
    bottom = 0,
    left = 0,
    right = 0,
    top = 0,
  },
  window_frame = {
    font_size = 15,
    --border_bottom_color = 'orange',
    --border_bottom_height = '2cell',
  },
  font = wezterm.font("Hack Nerd Font Mono", {weight="Regular", stretch="Normal", style="Normal"}),
  color_scheme = 'carbonfox',
  font_size = 22,
  --font_size = 18,
  enable_scroll_bar = false,
  --window_decorations = 'NONE',
}
