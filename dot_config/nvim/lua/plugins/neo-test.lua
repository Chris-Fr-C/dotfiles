return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
    },
    config = function()
        require("neotest").setup({
            log_level = vim.log.levels.INFO,
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = false },
                    runner = "pytest",
                }),
                require("neotest-vstest"),
            },
        })
    end,
}
