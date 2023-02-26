---- Gutter
vim.opt.number = true -- Show Line Numbers.
vim.opt.relativenumber = false -- Don't use relative numbers
vim.opt.signcolumn = "yes" -- Always show the signcolumn.

---- Tabs and Spaces
vim.opt.tabstop = 4 -- Set 4 spaces per tab.
vim.opt.softtabstop = 4 -- Set 4 spaces per tab.
vim.opt.shiftwidth = 4 -- Set 4 spaces per tab.
vim.opt.smarttab = true -- Use tab spaces when inserting or deleting white spaces.
vim.opt.expandtab = true -- Use spaces instead of tabs.
vim.opt.shiftround = true -- Rounds white spaces to `shiftwidth` when using < and >.
vim.opt.foldmethod = "indent" -- fold based on indent overriden in the tree-sitter config
vim.opt.foldenable = false
vim.opt.foldlevel = 99

---- Search
vim.opt.inccommand = "nosplit" -- Incremental Substitution.
vim.opt.ignorecase = true -- Ignore case by default.
vim.opt.smartcase = true -- Don't ignore case when there's upper case.

---- Split Directions
vim.opt.splitbelow = true -- New Vertical splits get created below
vim.opt.splitright = true -- New Horizontal splits get created to the right
vim.opt.showtabline = 2 -- Always show the tabline

---- Display list characters.
vim.opt.list = true -- Display list characters (whitespace).
vim.opt.listchars:append({
    tab = "» ",
    extends = "›",
    precedes = "‹",
    nbsp = "·",
    trail = "·",
})
vim.opt.colorcolumn = { 88 }

---- Misc.
vim.opt.mouse = "a" -- Enable mouse support.
vim.opt.clipboard:append("unnamed") -- Use system clipboard.
vim.opt.wrap = false -- Disable wrapping.
vim.opt.hidden = true -- Hide buffers instead of closing them when leaving them.
vim.opt.swapfile = false -- Don't use swap files.
vim.opt.cursorline = true -- Highlight current line
vim.opt.laststatus = 3 -- Global status line instead of per split.
vim.opt.timeoutlen = 500 -- Instant response from things like which-key, completion, etc
vim.opt.termguicolors = true -- Good colors
vim.opt.cmdheight = 0
