return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-python",
        "rouge8/neotest-rust",

    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-python")({
                    python = ".venv/Scripts/python",
                }),
                require("neotest-rust"),
            },
        })
    end,
    keys = {
        {
            "<leader>tt",
            function() require("neotest").run.run(vim.fn.expand("%")) end,
            desc = "Run File",
        },
        {
            "<leader>tT",
            function() require("neotest").run.run(vim.loop.cwd()) end,
            desc = "Run All Test Files",
        },
        {
            "<leader>tr",
            function() require("neotest").run.run() end,
            desc = "Run Nearest",
        },
        {
            "<leader>ts",
            function() require("neotest").summary.toggle() end,
            desc = "Toggle Summary",
        },
        {
            "<leader>to",
            function() require("neotest").output.open({ enter = true, auto_close = true }) end,
            desc = "Show Output",
        },
        {
            "<leader>tO",
            function() require("neotest").output_panel.toggle() end,
            desc = "Toggle Output Panel",
        },
        {
            "<leader>tS",
            function() require("neotest").run.stop() end,
            desc = "Stop",
        },
    },
}
