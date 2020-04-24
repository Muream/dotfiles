local layer = {}

--- Returns plugins required for this layer
function layer.register_plugins()
end

--- Configures vim and plugins for this layer
function layer.init_config()
    local lsp = require("layer.lsp")
    local nvim_lsp = require("nvim_lsp")

    -- TODO: Make this configurable per-project
    lsp.register_server(
        nvim_lsp.sumneko_lua,
        {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = {
                            "vim",
                        },
                    },
                },
            },
            cmd = {
                "/home/muream/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/bin/Linux/lua-language-server",
                "-E",
                "/home/muream/.cache/nvim/nvim_lsp/sumneko_lua/lua-language-server/main.lua" 
            },
        }
    )

end

return layer
