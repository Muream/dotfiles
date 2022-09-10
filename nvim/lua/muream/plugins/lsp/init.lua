-- Setup lspconfig.

--- Diagnostic Signs
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local lsp_augroup = vim.api.nvim_create_augroup("LSP", {})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function(client, bufnr)
    -- LSP Saga
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { buffer = 0, desc = "Hover Documentation [LSP]" })
    vim.keymap.set("n", "<C-v><C-.>", "<cmd> Lspsaga code_action<cr>", { silent = true })
    vim.keymap.set("n", "<F2>", "<cmd> Lspsaga rename<cr>", { silent = true })

    -- Go To
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0, desc = "Go To Definition [LSP]" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0, desc = "Go To Declaration [LSP]" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0, desc = "Go To Implementation [LSP]" })
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0, desc = "Go to Type Definition [LSP]" })

    -- Diagnostics
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", { buffer = 0 })

    -- actions
    vim.keymap.set("n", "gf", vim.lsp.buf.formatting_sync, { buffer = 0, desc = "Format Document [LSP]" })

    -- Format on save autocmd
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = lsp_augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = lsp_augroup,
            buffer = bufnr,
            callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                vim.lsp.buf.formatting_sync()
            end,
        })
    end
end

require("mason-lspconfig").setup_handlers({
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end,
    ["sumneko_lua"] = function()
        require("lspconfig").sumneko_lua.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }

    end
})
