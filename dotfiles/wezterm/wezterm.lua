local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

require("keys").setup(config)

-- Default shell
config.default_prog = { "nu" }


-- General Theme

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
local function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return "Dark"
end

-- Return the relevant colorscheme based on the system theme
local function scheme_from_appearance(appearance)
    if appearance:find("Dark") then
        return "Catppuccin Mocha"
    else
        return "Catppuccin Latte"
    end
end

config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"

-- Set the theme based on the system theme
config.color_scheme = scheme_from_appearance(get_appearance())

-- config.front_end = "WebGpu"
config.prefer_egl = true
config.max_fps = 60
-- config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 14.0

-- General Options
config.adjust_window_size_when_changing_font_size = false

-- Tab Bar config
-- config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false

return config
