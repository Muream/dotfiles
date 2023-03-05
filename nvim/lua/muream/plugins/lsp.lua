local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
return {
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Improved LSP UI
            {
                "glepnir/lspsaga.nvim",
                event = "BufRead",
                config = function()
                    require("lspsaga").setup({})
                end,
                dependencies = {
                    { "nvim-tree/nvim-web-devicons" },
                    --Please make sure you install markdown and markdown_inline parser
                    { "nvim-treesitter/nvim-treesitter" }
                }
            },
            {
                "folke/trouble.nvim",
                dependencies = { "nvim-tree/nvim-web-devicons" },
                config = function()
                    require("trouble").setup({})
                end
            },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
        config = function()
            ----
            local lsp = require("lsp-zero")

            -------- Initial lsp config
            lsp.preset({
                name = "recommended",
                set_lsp_keymaps = false,
            })

            -------- pre installed lsp providers
            lsp.ensure_installed({
                "rust_analyzer",
                "pyright",
            })
            lsp.configure('rust_analyzer', {
                settings = {
                    checkOnSave = {
                        command = "cargo clippy"
                    },
                }
            })

            -------- Completion hotkeys
            local cmpa = require("cmp")
            local cmp_mappings = lsp.defaults.cmp_mappings({
                ["<C-Space>"] = cmpa.mapping.complete(),
                ["<C-e>"] = cmpa.mapping.abort(),
            })

            -------- disable completion with tab
            cmp_mappings["<Tab>"] = cmpa.mapping.confirm()
            cmp_mappings["<S-Tab>"] = nil


            lsp.setup_nvim_cmp({
                mapping = cmp_mappings
            })

            -------- on attach hotkeys
            lsp.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }

                vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
                vim.keymap.set("n", "C-.", ":LspSaga code_action<cr>", opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<Ctrl-k>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<F2>", ":Lspsaga rename<cr>", opts)
                vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
                vim.keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<cr>", opts)
                vim.keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<cr>", opts)

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
