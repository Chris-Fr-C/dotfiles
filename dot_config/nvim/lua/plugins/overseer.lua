return {
    "stevearc/overseer.nvim",
    opts = function()
        -- Ensure Overseer is loaded
        local overseer = require("overseer")

        -- Keymap to open Overseer task template picker
        vim.keymap.set("n", "<leader>ot", function()
            overseer.run_template()
        end, { desc = "Run Overseer Task Template" })

        return {
            templates = {
                "builtin",
                "task",
            },
        }
    end,
}
