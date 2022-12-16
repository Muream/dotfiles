-- local ensure_packer = function()
--     local fn = vim.fn
--     local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
--     if fn.empty(fn.glob(install_path)) > 0 then
--         fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
--         vim.cmd [[packadd packer.nvim]]
--         return true
--     end
--     return false
-- end
--
-- local packer_bootstrap = ensure_packer()

return require("packer").startup {
    function(use)
        -- Packer
        use "wbthomason/packer.nvim"

        use {
            "nvim-telescope/telescope.nvim",
            requires = require("muream.plugins.telescope").requires,
            setup = require("muream.plugins.telescope").setup
        }

        use {
            "kyazdani42/nvim-tree.lua",
            requires = require("muream.plugins.nvim-tree").requires,
            tag = "nightly", -- optional, updated every week. (see issue #1193)
            config = require("muream.plugins.nvim-tree").setup
        }

        use {
            "folke/trouble.nvim",
            requires = require("muream.plugins.trouble").requires,
            config = require("muream.plugins.trouble").setup
        }

        use {
            "folke/which-key.nvim",
            config = require("muream.plugins.which-key").setup
        }


        -- LSP
        use {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end
        }
        use {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup()
            end
        }
        use "neovim/nvim-lspconfig" -- Configurations for Nvim LSP
        use {
            "jose-elias-alvarez/null-ls.nvim", -- General LSP for linting and formatting not supported by other LSPs
            config = require("muream.plugins.null-ls").setup
        }
        use "nvim-lua/lsp-status.nvim"
        use {
            "glepnir/lspsaga.nvim",
            branch = "main",
            config = require("muream.plugins.lspsaga").setup,
        }
        -- Tree Sitter
        use {
            "nvim-treesitter/nvim-treesitter",
            requires = require("muream.plugins.treesitter").requires,
            run = require("muream.plugins.treesitter").run,
            config = require("muream.plugins.treesitter").setup,
        }

        -- Completion
        use {
            "hrsh7th/nvim-cmp",
            requires = require("muream.plugins.cmp").requires,
            config = require("muream.plugins.cmp").setup,
        }


        -- Editing
        use "tpope/vim-surround"
        use "tpope/vim-repeat"
        use {
            "windwp/nvim-autopairs",
            config = require("muream.plugins.autopairs").setup
        }
        use {
            "numToStr/Comment.nvim",
            config = require("muream.plugins.comment").setup
        }
        use {
            'AckslD/nvim-trevJ.lua',
            config = require("muream.plugins.trevj").setup
        }

        -- Git
        use {
            "lewis6991/gitsigns.nvim",
            requires = require("muream.plugins.gitsigns").requires,
            config = require("muream.plugins.gitsigns").setup
        }

        use({
            "iamcco/markdown-preview.nvim",
            run = function() vim.fn["mkdp#util#install"]() end,
        })

        -- Look and Feel

        -- use {
        --     "navarasu/onedark.nvim",
        --     config = function()
        --         require("onedark").setup({
        --             style = "warmer",
        --             term_colors = true, -- Change terminal color as per the selected theme style
        --             code_style = {
        --                 comments = "none",
        --                 keywords = "none",
        --                 functions = "none",
        --                 strings = "none",
        --                 variables = "none"
        --             },
        --         })
        --         require("onedark").load()
        --     end
        -- }

        use {
            "Shatur/neovim-ayu",
            config = function()
                local ayu = require("ayu")
                ayu.setup({})
                ayu.colorscheme()
            end
        }

        use "lukas-reineke/indent-blankline.nvim"
        use {
            "nvim-lualine/lualine.nvim",
            requires = require("muream.plugins.lualine").requires,
            config = require("muream.plugins.lualine").setup
        }
        use {
            "romgrk/barbar.nvim",
            requires = require("muream.plugins.barbar").requires,
            config = require("muream.plugins.barbar").setup
        }

        -- if packer_bootstrap then
        --     require('packer').sync()
        -- end
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end
        }
    }
}
