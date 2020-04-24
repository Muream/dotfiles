local edit_mode = require("core.edit_mode")
local plug = require("core.plug")
local keybind = require("core.keybind")

local layer = {}


function layer.register_plugins()
    plug.add_plugin("neovim/nvim-lsp")
    plug.add_plugin('haorenW1025/completion-nvim')
end

function layer.init_config()
    -- completion
    vim.cmd("set completeopt=menuone,noinsert,noselect")
    vim.cmd("set shortmess+=c")
    vim.cmd("inoremap <silent><expr> <c-n> completion#trigger_completion()") -- couldn't seem to do that with vim.api.nvim_set_keymap ?
    vim.cmd("let g:completion_trigger_character = ['.', '::']")

    -- lsp
    keybind.bind_function(edit_mode.NORMAL, "<leader>ls", user_stop_all_clients, nil)
    keybind.bind_function(edit_mode.NORMAL, "<leader>la", user_attach_client, nil)

    -- Show in vim-airline the attached LSP client
    if plug.has_plugin("vim-airline") then
        vim.api.nvim_exec(
            [[
            function! CLspGetAirlinePart()
                return luaeval("require('layer.lsp')._get_airline_part()")
            endfunction
            ]],
            false
            )
        vim.fn["airline#parts#define_function"]("c_lsp", "CLspGetAirlinePart")
        vim.fn["airline#parts#define_accent"]("c_lsp", "yellow")
        vim.g.airline_section_y = vim.fn["airline#section#create_right"]{"c_lsp", "ffenc"}
    end
end

function user_stop_all_clients()
  local clients = vim.lsp.get_active_clients()

  if #clients > 0 then
    vim.lsp.stop_client(clients)
    for _, v in pairs(clients) do
      print("Stopped LSP client " .. v.name)
    end
  else
    print("No LSP clients are running")
  end
end

function user_attach_client()
    local filetype = vim.bo[0].filetype

    local server = layer.filetype_servers[filetype]
    if server ~= nil then
        print("Attaching LSP client " .. server.name .. " to buffer")
        server.manager.try_add()
    else
        print("No LSP client registered for filetype " .. filetype)
    end
end

--- Get the LSP status line part for vim-airline
function layer._get_airline_part()
    local clients = vim.lsp.buf_get_clients()
    local client_names = {}
    for _, v in pairs(clients) do
        table.insert(client_names, v.name)
    end

    if #client_names > 0 then
        return "LSP: " .. table.concat(client_names, ", ")
    else
        return ""
    end
end

--- Maps filetypes to their server definitions
--
-- <br>
-- Eg: `["rust"] = nvim_lsp.rls`
--
-- <br>
-- See `nvim_lsp` for what a server definition looks like
layer.filetype_servers = {}

--- Register an LSP server
--
-- @param server An LSP server definition (in the format expected by `nvim_lsp`)
-- @param config The config for the server (in the format expected by `nvim_lsp`)
function layer.register_server(server, config)
    local completion = require("completion") -- From completion-nvim

    config = config or {}
    config.on_attach = completion.on_attach
    config = vim.tbl_extend("keep", config, server.document_config.default_config)

    server.setup(config)

    for _, v in pairs(config.filetypes) do
        layer.filetype_servers[v] = server
    end
end

return layer
