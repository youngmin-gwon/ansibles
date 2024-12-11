-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font("MesloLGL Nerd Font")
config.font_size = 15

-- Theme
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Catppuccin Macchiato'
  else
    return 'Catppuccin Latte'
  end
end

function background_color_for_appearance(appearance)
  if appearance:find 'Dark' then
    return '#24273a'
  else
    return '#eff1f5'
  end
end

function hover_background_color_for_appearance(appearance)
  if appearance:find 'Dark' then
    return '#1e2030'
  else
    return '#bcc0cc'
  end
end

function hover_foreground_color_for_appearance(appearance)
  if appearance:find 'Dark' then
    return '#f0c6c6'
  else
    return '#dd7878'
  end
end

function inactive_background_color_for_appearance(appearance)
  if appearance:find 'Dark' then
    return '#24273a'
  else
    return '#eff1f5'
  end
end

function inactive_foreground_color_for_appearance(appearance)
  if appearance:find 'Dark' then
    return '#a5adcb'
  else
    return '#6c6f85'
  end
end

function active_background_color_for_appearance(appearance)
  if appearance:find 'Dark' then
    return '#5b6078'
  else
    return '#acb0be'
  end
end

function active_foreground_color_for_appearance(appearance)
  if appearance:find 'Dark' then
    return '#ed8796'
  else
    return '#d20f39'
  end
end

config.use_fancy_tab_bar = false
config.color_scheme = scheme_for_appearance(get_appearance())
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10
config.colors = {
  tab_bar = {
    background = background_color_for_appearance(get_appearance()),
    active_tab = {
      bg_color = active_background_color_for_appearance(get_appearance()),
      fg_color = active_foreground_color_for_appearance(get_appearance()),
      italic = true,
    },
    inactive_tab = {
      bg_color = inactive_background_color_for_appearance(get_appearance()),
      fg_color = inactive_foreground_color_for_appearance(get_appearance()),
    },
    inactive_tab_hover = {
      bg_color = hover_background_color_for_appearance(get_appearance()),
      fg_color = hover_foreground_color_for_appearance(get_appearance()),
    },
    new_tab = {
      bg_color = inactive_background_color_for_appearance(get_appearance()),
      fg_color = inactive_foreground_color_for_appearance(get_appearance()),
    },
    new_tab_hover = {
      bg_color = hover_background_color_for_appearance(get_appearance()),
      fg_color = hover_foreground_color_for_appearance(get_appearance()),
    },
  }
}

config.enable_scroll_bar = true

-- and finally, return the configuration to wezterm
return config
