vim.pack.add({ "https://github.com/nvim-mini/mini.pick" })
local win_config = function()
    local height = math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.618 * vim.o.columns)
    return {
        anchor = 'NW',
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
    }
end

require("mini.pick").setup({ window = { config = win_config } })

vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")
vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>fb", ":Pick buffers<CR>")

-- LSP pickers
-- Supported scopes: 
--  - 'declaration'
--  - 'definition'
--  - 'document_symbol'
--  - 'implementation'
--  - 'references'
--  - 'type_definition'
--  - 'workspace_symbol'
vim.keymap.set("n", "<leader>fs", ":Pick lsp scope='document_symbol'<CR>")
vim.keymap.set("n", "<leader>fS", ":Pick lsp scope='workspace_symbol'<CR>")
vim.keymap.set("n", "<leader>fr", ":Pick lsp scope='references'<CR>")
