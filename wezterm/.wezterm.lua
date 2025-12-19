local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Remove sound
config.audible_bell = "Disabled"

-- Add a padding in the terminal
config.window_padding = { left = 20, right = 20, top = 20, bottom = 20 }

-- Load theme
config.color_scheme_dirs = { "~/homelab/wezterm/colors/" }
config.color_scheme = "GitHub Dark Dimmed"

-- Configure font
config.font = wezterm.font({
  family = "Agave Nerd Font Mono",
  weight = "Regular",
})
config.font_size = 17.0
config.line_height = 1.2
config.cell_width = 0.9
config.adjust_window_size_when_changing_font_size = false

-- Skip some confirmations
config.window_close_confirmation = "NeverPrompt"
config.skip_close_confirmation_for_processes_named = { "bash", "sh", "zsh", "tmux" }

-- Launch TMUX at start
config.default_prog = { "bash", "-lic", "tmux" }

-- Disable tab bar
config.enable_tab_bar = false

-- Forward keys properly
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false
config.enable_csi_u_key_encoding = true

return config
