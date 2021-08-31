-- automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
    -------------------------
    -- Packer
    -------------------------
    use 'wbthomason/packer.nvim'

    -------------------------
    -- Look and Feel
    -------------------------
    use 'tjdevries/colorbuddy.vim' 
    use 'RRethy/nvim-base16' 
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("indent_blankline").setup {
                char = "│",
            }
            vim.cmd [[highlight IndentBlanklineChar guifg=#373b41  blend=nocombine]]
        end
    }
    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'powerline'
            }
        }
        end
    }

    -------------------------
    -- Editing
    -------------------------
    use 'tpope/vim-surround' 
    use 'tpope/vim-commentary' 
    use 'tpope/vim-repeat' 
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup{}
        end
    }

    -------------------------
    -- LSP
    -------------------------
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('lspconfig').pyright.setup{}
            require('lspconfig').rust_analyzer.setup{}
        end
    }

    use{
        'glepnir/lspsaga.nvim',
        config = function()
            require('lspsaga').init_lsp_saga()
        end
    }
    use {
        'mhartington/formatter.nvim',
        config = function()
            require('formatter').setup({
              filetype = {
                python = {
                  -- black
                  function()
                    return {
                      exe = "black",
                      args = {vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
                      -- stdin = true
                      stdin = false
                    }
                  end
                },
                rust = {
                  -- Rustfmt
                  function()
                    return {
                      exe = "rustfmt",
                      args = {"--emit=stdout"},
                      stdin = true
                    }
                  end
                },
              }
            })
        end
    }

    -------------------------
    -- Autocomplete
    -------------------------
    use 'onsails/lspkind-nvim'
    use {
        'hrsh7th/nvim-cmp',
        requires = {'hrsh7th/cmp-nvim-lsp'},
        config = function()
            local cmp = require('cmp')
            local lspkind = require('lspkind')
            cmp.setup{
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<Tab>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                },
                formatting = {
                    format = function(entry, vim_item)
                      vim_item.kind = lspkind.presets.default[vim_item.kind]
                      return vim_item
                    end
                },
                sources = {
                    { name = 'nvim_lsp' },
                },
            }
        end
    }

    -------------------------
    -- TreeSitter 
    -------------------------
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                enable = true,
                highlight = { enable = true },
                indent = { enable = true }
            }
        end
    }
    use 'nvim-treesitter/playground'

    -------------------------
    -- Telescope
    -------------------------
    use {
        'nvim-telescope/telescope.nvim', 
         requires = { 
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons'
         }
     }

    -------------------------
    -- Nvim Tree
    -------------------------
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -------------------------
    -- Git
    -------------------------
    use 'TimUntersberger/neogit'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup()
        end

    }

end)

