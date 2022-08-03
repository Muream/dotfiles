M = {}

M.requires = {
    "hrsh7th/cmp-buffer", -- buffer words source
    "hrsh7th/cmp-path", -- file path sourec
    "hrsh7th/cmp-nvim-lsp", -- lsp source
    "hrsh7th/cmp-nvim-lua", -- Nvim Lua API source
    "saadparwaiz1/cmp_luasnip", -- LuaSnip source
    "onsails/lspkind.nvim", -- Nice icons for LSP completions
    "L3MON4D3/LuaSnip", -- Snippet engine
}

M.setup = function()
    vim.opt.completeopt = { "menu", "menuone", "noselect" }

    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup {
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },

        formatting = { format = lspkind.cmp_format() },

        mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),

        sources = cmp.config.sources({
            { name = "nvim_lua" },
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "buffer", keyword_length = 5 },
        }),

        experimental = { ghost_text = true }
    }
end

return M
