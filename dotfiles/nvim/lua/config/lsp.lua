-- Set default root markers for all clients
-- vim.lsp.config('*', {
--   root_markers = { '.git' },
-- })

vim.lsp.enable({
  "lua_ls",
  "clangd",
})


-- vim.lsp.config("lua_ls", {})
-- vim.lsp.config("clangd", {
--   cmd = {
--     "clangd",
--     "--header-insertion=never",
--   },
-- })

-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)

--   end,
-- })

