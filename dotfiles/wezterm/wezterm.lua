local wezterm = require("wezterm")
local act = wezterm.action

local function toggle_term(pane)
    local tab = pane:tab()
    local panes = tab:panes_with_info()
    if #panes == 1 then
        pane:split({
            direction = "Bottom",
            size = 0.3,
        })
    elseif panes[1].is_zoomed or panes[1].is_active then
        tab:set_zoomed(false)
        panes[2].pane:activate()
    else
        panes[1].pane:activate()
        tab:set_zoomed(true)
    end
end

local function run_command(pane, command)
    toggle_term(pane)

    local tab = pane:tab()
    local panes = tab:panes_with_info()
    tab:set_zoomed(false)
    panes[2].pane:send_text(command .. "\r\n")
end


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

config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"

-- Set the theme based on the system theme
config.color_scheme = scheme_from_appearance(get_appearance())

config.front_end = "WebGpu"
config.max_fps = 144
config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 14.0

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
    { key = "s", mods = "LEADER",       action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }), },
    { key = "v", mods = "LEADER",       action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }), },
    { key = "z", mods = "LEADER",       action = "TogglePaneZoomState" },
    { key = "x", mods = "LEADER",       action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },

    -- Navigation
    { key = "h", mods = "CTRL",         action = act.EmitEvent("ActivatePaneDirection-left") },
    { key = "j", mods = "CTRL",         action = act.EmitEvent("ActivatePaneDirection-down") },
    { key = "k", mods = "CTRL",         action = act.EmitEvent("ActivatePaneDirection-up") },
    { key = "l", mods = "CTRL",         action = act.EmitEvent("ActivatePaneDirection-right") },

    -- Move Panes
    { key = "H", mods = "LEADER",       action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
    { key = "J", mods = "LEADER",       action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
    { key = "K", mods = "LEADER",       action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
    { key = "L", mods = "LEADER",       action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },

    -- Change Tabs
    { key = "1", mods = "LEADER",       action = wezterm.action({ ActivateTab = 0 }) },
    { key = "2", mods = "LEADER",       action = wezterm.action({ ActivateTab = 1 }) },
    { key = "3", mods = "LEADER",       action = wezterm.action({ ActivateTab = 2 }) },
    { key = "4", mods = "LEADER",       action = wezterm.action({ ActivateTab = 3 }) },
    { key = "5", mods = "LEADER",       action = wezterm.action({ ActivateTab = 4 }) },
    { key = "6", mods = "LEADER",       action = wezterm.action({ ActivateTab = 5 }) },
    { key = "7", mods = "LEADER",       action = wezterm.action({ ActivateTab = 6 }) },
    { key = "8", mods = "LEADER",       action = wezterm.action({ ActivateTab = 7 }) },
    { key = "9", mods = "LEADER",       action = wezterm.action({ ActivateTab = 8 }) },

    -- Tab Management
    { key = '{', mods = 'SHIFT|ALT',    action = act.MoveTabRelative(-1) },
    { key = '}', mods = 'SHIFT|ALT',    action = act.MoveTabRelative(1) },

    { key = "c", mods = "LEADER",       action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
    { key = "&", mods = "LEADER|SHIFT", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
    {
        key = "f",
        mods = "LEADER",
        action = wezterm.action.SpawnCommandInNewTab({
            args = {
                "nu",
                "~/projects/dotfiles/dotfiles/wezterm/sessionizer.nu",
            }
        }),
    },
    {
        key = "`",
        mods = "CTRL",
        action = wezterm.action_callback(function(_, pane)
            toggle_term(pane)
        end),
    },
    {
        key = "b",
        mods = "LEADER",
        action = wezterm.action_callback(function(_, pane)
            run_command(pane, "task build")
        end),
    },

    {
        key = "r",
        mods = "LEADER",
        action = wezterm.action_callback(function(_, pane)
            run_command(pane, "task run")
        end),
    },
    {
        key = "t",
        mods = "LEADER",
        action = wezterm.action_callback(function(_, pane)
            run_command(pane, "task test")
        end),
    }
}

local function is_nvim(pane)
    return pane:get_user_vars().IS_NVIM == "true" or pane:get_foreground_process_name():find("n?vim")
end

local function conditional_activate_pane(window, pane, pane_direction, vim_direction)
    if is_nvim(pane) then
        window:perform_action(
        -- This should match the keybinds you set in Neovim.
            act.SendKey({ key = vim_direction, mods = "CTRL" }),
            pane
        )
    else
        window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
    end
end



wezterm.on(
    "ActivatePaneDirection-left",
    function(window, pane) conditional_activate_pane(window, pane, "Left", "h") end
)
wezterm.on(
    "ActivatePaneDirection-down",
    function(window, pane) conditional_activate_pane(window, pane, "Down", "j") end
)
wezterm.on(
    "ActivatePaneDirection-up",
    function(window, pane) conditional_activate_pane(window, pane, "Up", "k") end
)
wezterm.on(
    "ActivatePaneDirection-right",
    function(window, pane) conditional_activate_pane(window, pane, "Right", "l") end
)

return config
