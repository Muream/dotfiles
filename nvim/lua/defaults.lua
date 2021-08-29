-- General stuff
vim.opt.clipboard = "unnamed"
vim.opt.hidden = true
vim.opt.mouse = "a"
vim.splitbelow = true
vim.splitright = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.joinspaces = true
vim.opt.wrap = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- ColorScheme
vim.cmd('colorscheme base16-tomorrow-night')
