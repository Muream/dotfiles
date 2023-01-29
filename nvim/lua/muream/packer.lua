local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd.packadd("packer.nvim")
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- ---- LSP
    -- use {
    --     'VonHeikemen/lsp-zero.nvim',
    --     requires = {
    --         -- LSP Support
    --         { 'neovim/nvim-lspconfig' },
    --         { 'williamboman/mason.nvim' },
    --         { 'williamboman/mason-lspconfig.nvim' },

    --         -- Autocompletion
    --         { 'hrsh7th/nvim-cmp' },
    --         { 'hrsh7th/cmp-buffer' },
    --         { 'hrsh7th/cmp-path' },
    --         { 'saadparwaiz1/cmp_luasnip' },
    --         { 'hrsh7th/cmp-nvim-lsp' },
    --         { 'hrsh7th/cmp-nvim-lua' },

    --         -- Snippets
    --         { 'L3MON4D3/LuaSnip' },
    --         { 'rafamadriz/friendly-snippets' },
    --     }
    -- }
    -- use "jose-elias-alvarez/null-ls.nvim"
    -- use "jayp0521/mason-null-ls.nvim"

    -- use "j-hui/fidget.nvim" -- Useful status updates for LSP
    use 'folke/neodev.nvim' -- Additional lua configuration, makes nvim stuff amazing

    -- ---- UI
    -- use {
    --     "kyazdani42/nvim-tree.lua",
    --     tag = "nightly", -- optional, updated every week. (see issue #1193)
    -- }

    -- use {
    --     'nvim-telescope/telescope.nvim', tag = '0.1.0',
    --     requires = {
    --         "nvim-lua/plenary.nvim",
    --         "kyazdani42/nvim-web-devicons",
    --     }
    -- }

    -- ---- Editor Comfort
    -- use { -- Highlight, edit, and navigate code
    --     'nvim-treesitter/nvim-treesitter',
    --     run = function()
    --         pcall(require('nvim-treesitter.install').update { with_sync = true })
    --     end,
    -- }
    -- use { -- Additional text objects via treesitter
    --     'nvim-treesitter/nvim-treesitter-textobjects',
    --     after = 'nvim-treesitter',
    -- }

    -- use {
    --     "lewis6991/gitsigns.nvim",
    --     requires = { "nvim-lua/plenary.nvim" },
    -- }

    -- use "lukas-reineke/indent-blankline.nvim"
    -- use "lukas-reineke/virt-column.nvim"

    -- use {
    --     "nvim-lualine/lualine.nvim",
    --     requires = { "kyazdani42/nvim-web-devicons" },
    -- }

    -- use "romgrk/barbar.nvim"
    -- use {
    --     "RRethy/nvim-base16",
    --     config = function()
    --         require("base16-colorscheme").setup({
    --             base00 = "#151515", base01 = "#242424", base02 = "#383838", base03 = "#969896",
    --             base04 = "#b4b7b4", base05 = "#c5c8c6", base06 = "#e0e0e0", base07 = "#ffffff",
    --             base08 = "#cc6666", base09 = "#de935f", base0A = "#f0c674", base0B = "#b5bd68",
    --             base0C = "#8abeb7", base0D = "#81a2be", base0E = "#b294bb", base0F = "#a3685a"
    --         })
    --         vim.cmd.highlight("VertSplit guifg=#383838")
    --     end,
    -- }

    -- use {
    --     "norcalli/nvim-colorizer.lua",
    --     config = function()
    --         require("colorizer").setup()
    --     end
    -- }

    -- ---- Editing Goodness
    -- use "tpope/vim-surround"
    -- use "tpope/vim-repeat"
    -- use "numToStr/Comment.nvim"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if pcker_bootstrap then
        require('packer').sync()
    end
end)
