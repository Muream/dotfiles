local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
config = wezterm.config_builder()

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

-- Set the theme based on the system theme
config.color_scheme = scheme_from_appearance(get_appearance())

config.font = wezterm.font("CaskaydiaCove Nerd Font")

-- General Options
config.adjust_window_size_when_changing_font_size = false

-- Tab Bar config
-- config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false

-- Keymap
config.leader = { key = "b", mods = "CTRL" }
config.keys = {
    -- Pane Management
    { key = "s", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
    {
        key = "v",
        mods = "LEADER",
        action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
    },
    { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
    { key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },

    -- Navigation
    { key = "h", mods = "LEADER", action = act.EmitEvent("ActivatePaneDirection-left") },
    { key = "j", mods = "LEADER", action = act.EmitEvent("ActivatePaneDirection-down") },
    { key = "k", mods = "LEADER", action = act.EmitEvent("ActivatePaneDirection-up") },
    { key = "l", mods = "LEADER", action = act.EmitEvent("ActivatePaneDirection-right") },

    -- Move Panes
    { key = "H", mods = "LEADER", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
    { key = "J", mods = "LEADER", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
    { key = "K", mods = "LEADER", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
    { key = "L", mods = "LEADER", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },

    -- Change Tabs
    { key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
    { key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
    { key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
    { key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
    { key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
    { key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
    { key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
    { key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
    { key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },

    -- Tab Management
    { key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
    { key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
    {
        key = "f",
        mods = "LEADER",
        action = wezterm.action.SpawnCommandInNewTab({
            args = {
                "nu",
                "~/projects/dotfiles/wezterm/sessionizer.nu",
            },
        }),
    },
}

-- Vim Navigation
local function isViProcess(pane)
    -- get_foreground_process_name On Linux, macOS and Windows,
    -- the process can be queried to determine this path. Other operating systems
    -- (notably, FreeBSD and other unix systems) are not currently supported
    wezterm.log_info("Foreground Process: " .. pane:get_foreground_process_name())
    wezterm.log_info(pane:get_tty_name())
    return pane:get_foreground_process_name():find("n?vim") ~= nil
    -- return pane:get_title():find("n?vim") ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
    if isViProcess(pane) then
        window:perform_action(
            -- This should match the keybinds you set in Neovim.
            act.SendKey({ key = vim_direction, mods = "CTRL" }),
            pane
        )
    else
        window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
    end
end

wezterm.on("ActivatePaneDirection-right", function(window, pane)
    conditionalActivatePane(window, pane, "Right", "l")
end)
wezterm.on("ActivatePaneDirection-left", function(window, pane)
    conditionalActivatePane(window, pane, "Left", "h")
end)
wezterm.on("ActivatePaneDirection-up", function(window, pane)
    conditionalActivatePane(window, pane, "Up", "k")
end)
wezterm.on("ActivatePaneDirection-down", function(window, pane)
    conditionalActivatePane(window, pane, "Down", "j")
end)

return config
