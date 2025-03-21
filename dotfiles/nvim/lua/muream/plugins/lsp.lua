return {
    {
        -- LSP Configuration & Plugins
        "neovim/nvim-lspconfig",
        dependencies = {
            -- "nvim-cmp",

            -- Automatically install LSPs to stdpath for neovim
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Useful status updates for LSP
            "fidget.nvim",
        },
        config = function()
            -- Add borders to the hover popup
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

            local on_attach = function(_, bufnr)
                local nmap = function(keys, func, desc)
                    if desc then
                        desc = "LSP: " .. desc
                    end
                    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
                end
                nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                nmap("<leader>fm", function()
                    require("conform").format({ bufnr = bufnr, lsp_fallback = true })
                end, "[F]or[m]at")

                nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
                nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
                nmap("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")

                nmap("K", vim.lsp.buf.hover, "Hover Documentation")
                nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

                vim.keymap.set("n", "gl", vim.diagnostic.open_float)
                -- vim.keymap.set("n", "[d", ":Lspsaga diagnostic_jump_prev<cr>")
                -- vim.keymap.set("n", "]d", ":Lspsaga diagnostic_jump_next<cr>")
            end

            local servers = {
                pyright = {},
                ruff = {},
                rust_analyzer = {},
                ols = {},
                clangd = {},

                lua_ls = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
                jsonls = {},
            }
            require("lspconfig").gleam.setup({})

            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            -- Ensure the servers above are installed
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            mason_lspconfig.setup_handlers({
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = capabilities,
                        on_attach = on_attach,
                        settings = servers[server_name],
                    })
                end,
            })
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
            require("lsp_signature").setup(opts)
        end,
    },
    {
        "stevearc/conform.nvim",
        opts = {
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            formatters_by_ft = {
                lua = { "stylua" },
                rust = { "rustfmt" },
                python = { "ruff_fix", "ruff_format" },
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        opts = {
            events = { "BufWritePost", "BufReadPost", "InsertLeave" },
            linters_by_ft = {
                lua = { "selene" },
            },
        },
        config = function(_, opts)
            local lint = require("lint")
            lint.linters_by_ft = opts.linters_by_ft

            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = { ":MasonUpdate" },
        opts = {
            ensure_installed = {
                "stylua",
                "rustfmt",
                "ruff",
            },
        },
    },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {},
    },
}
