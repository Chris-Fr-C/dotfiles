-- Testing pannel with Leader t s
return {
  { "nvim-neotest/nvim-nio" },

  { "nvim-neotest/neotest-python" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/nvim-nio",
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
  },
}
