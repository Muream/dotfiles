----
local lsp = require('lsp-zero')

-------- Initial lsp config
lsp.preset('recommended')

-------- pre installed lsp providers
lsp.ensure_installed({
    'sumneko_lua',
    'rust_analyzer',
    'pyright',
})

-------- Completion hotkeys
local cmp = require("cmp")
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
})

-------- disable completion with tab
cmp_mappings['<Tab>'] = cmp.mapping.confirm()
cmp_mappings['<S-Tab>'] = nil


lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

-------- on attach hotkeys
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
end)

-------- Apply config
lsp.setup()

---- NULL LS
local mason_nullls = require("mason-null-ls")
mason_nullls.setup({
    ensure_installed = {
        -- Opt to list sources here, when available in mason.
        "black",
        "isort",
    },
    automatic_installation = false,
    automatic_setup = true,
})

require("null-ls").setup(
    {
        sources = {
            -- Anything not supported by mason.
        }
    }
)

mason_nullls.setup_handlers()

---- Fidget
require('fidget').setup()


---- Neodev
require('neodev').setup()
