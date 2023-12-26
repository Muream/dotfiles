
-- the Haxe parser isn't available to auto install
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.haxe = {
    install_info = {
        url = "https://github.com/vantreeseba/tree-sitter-haxe",
        files = { "src/parser.c" },
        -- optional entries:
        branch = "main",
    },
    filetype = "haxe",
}

return {
    {
        -- Highlight, edit, and navigate code
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/playground",
        },
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "json",
                "jsonc",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "regex",
                "rust",
                "toml",
                "vim",
                "vimdoc",
                "ocaml",
                "haxe",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            indent = { enable = true },
            highlight = { enable = true },

            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                    }
                }
            },
            swap = {
                enable = true,
                swap_next = { ['<leader>a'] = '@parameter.inner' },
                swap_previous = { ['<leader>A'] = '@parameter.inner' },
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<c-space>',
                    node_incremental = '<c-space>',
                    scope_incremental = '<c-s>',
                    node_decremental = '<M-space>',
                },
            },
            playground = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
