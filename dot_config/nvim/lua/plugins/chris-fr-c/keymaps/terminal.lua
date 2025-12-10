vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    local opts = { buffer = 0 }

    -- Let <Esc> pass through to the terminal (no interception)
    vim.keymap.set("t", "<Esc>", "<Esc>", opts)

    -- And to leave the leave terminal mode
    vim.keymap.set("t", "<Shift-Esc>", [[<C-\><C-n>]], opts)
  end,
})

return {}
