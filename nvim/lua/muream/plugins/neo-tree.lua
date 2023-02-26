return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
        { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        {
            "s1n7ax/nvim-window-picker",
            config = true,
        }
    },
    config = function()
        require("neo-tree").setup({
            source_selector = {
                winbar = true,
            },
            window = {
                width = 35,
            },
            event_handlers = {
                {
                    event = "neo_tree_window_after_open",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd.wincmd("=")
                        end
                        require("bufferline.api").set_offset(
                            vim.fn.winwidth(args.winid),
                            'FileTree'
                        )
                    end
                },
                {
                    event = "neo_tree_window_after_close",
                    handler = function(args)
                        if args.position == "left" or args.position == "right" then
                            vim.cmd.wincmd("=")
                        end
                        require("bufferline.api").set_offset(0)
                    end
                }
            }
        })
    end,
}
