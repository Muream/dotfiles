
-- The version control layer
-- @module layer.vcs

local layer = {}

local plug = require("core.plug")

--- Returns plugins required for this layer
function layer.register_plugins()
    plug.add_plugin("mhinz/vim-signify") -- VCS diffs in the gutter

    if plug.has_plugin("nerdtree") then
        plug.add_plugin("Xuyuanp/nerdtree-git-plugin")
    end
end

--- Configures vim and plugins for this layer
function layer.init_config()
    -- Signify config - use a nice little colored line for add/changes, and don't show deleted line counts
    vim.g.signify_sign_add = "▏"
    vim.g.signify_sign_change = "▏"
    vim.g.signify_sign_show_count = 0

    -- Set NERDTree Git symbols
    if plug.has_plugin("nerdtree") then
        vim.api.nvim_set_var(
            "NERDTreeIndicatorMapCustom",
            {
                Modified = "M",
                Staged = "+",
                Untracked = "U",
                Renamed = "R",
                Unmerged = "=",
                Deleted = "X",
                Dirty = "M",
                Clean = "C",
                Ignored = "I",
                Unknown = "?",
            }
            )
    end
end

return layer
