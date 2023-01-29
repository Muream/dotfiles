local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
return {
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        },
        config = function()
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

                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end)

            -------- Apply config
            lsp.setup()
        end
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "jayp0521/mason-null-ls.nvim" },
        config = function()

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

            require("null-ls").setup({
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end
            })

            mason_nullls.setup_handlers()
        end
    },
    "j-hui/fidget.nvim", -- Useful status updates for LSP
}
