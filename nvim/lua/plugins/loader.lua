-- automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd "packadd packer.nvim"
end


return require("packer").startup(
    function(use)
        -- Packer
        use "wbthomason/packer.nvim"

        use {
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/plenary.nvim" },
        }

        -- LSP
        use "neovim/nvim-lspconfig" -- Configurations for Nvim LSP
        use "williamboman/nvim-lsp-installer"

        use "nvim-treesitter/nvim-treesitter"

        -- Completion
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-nvim-lua"

        -- Editing
        use "tpope/vim-surround"
        use "tpope/vim-repeat"
        use {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end
        }

        -- Git
        use {
            "lewis6991/gitsigns.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                require("gitsigns").setup()
            end
        }

        -- Color Scheme
        use "tjdevries/colorbuddy.vim"
        use {
            "Th3Whit3Wolf/onebuddy",
            config = function()
                require("colorbuddy").colorscheme("onebuddy")
            end
        }

        use "lukas-reineke/indent-blankline.nvim"

    end
)
