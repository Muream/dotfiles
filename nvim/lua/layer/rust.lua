--- Rust layer
-- @module layer.rust

local layer = {}

--- Returns plugins required for this layer
function layer.register_plugins()
end

--- Configures vim and plugins for this layer
function layer.init_config()
    local lsp = require("layer.lsp")
    local nvim_lsp = require("nvim_lsp")

    lsp.register_server(nvim_lsp.rust_analyzer)
end

return layer
