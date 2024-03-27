-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

config.color_scheme_dirs = { '~/.vim/plugged/tokyonight.nvim/extras/wezterm' }

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'tokyonight_night'
  else
    return 'tokyonight_day'
  end
end

-- Change the colour scheme:
config.color_scheme = scheme_for_appearance(get_appearance())

-- Tab bar at the bottom
config.tab_bar_at_bottom = true

-- Return the configuration to wezterm
return config
