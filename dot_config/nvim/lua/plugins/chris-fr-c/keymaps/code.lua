-- Making sure that x deletes without putting it to the register.
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })

-- Overseer template

vim.keymap.set("n", "<leader>ot", function()
  require("overseer").run_template()
end, { desc = "Run Overseer Task Template" })

return {}
