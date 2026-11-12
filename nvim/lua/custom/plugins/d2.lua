-- Set global plugin options before the plugin loads
vim.g.d2_fmt_autosave = 1
vim.g.d2_fmt_command = "d2 fmt"
vim.g.d2_fmt_fail_silently = 0

vim.g.d2_ascii_autorender = 1
vim.g.d2_ascii_command = "d2"
vim.g.d2_ascii_preview_width = math.floor(vim.o.columns / 2)
vim.g.d2_ascii_mode = "extended"

vim.g.d2_validate_autosave = 0
vim.g.d2_validate_command = "d2 validate"
vim.g.d2_list_type = "quickfix"
vim.g.d2_validate_fail_silently = 0

vim.g.d2_play_command = "d2 play"
vim.g.d2_play_theme = 0
vim.g.d2_play_sketch = 0

-- Load the plugin and set buffer-local keymaps only for .d2 files
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("d2_config", { clear = true }),
  pattern = "d2",
  callback = function(event)
    vim.pack.add({
      "https://github.com/terrastruct/d2-vim",
    })

    local containers = require("custom.config.keymap-containers")
    local d2_key = containers.visualize.key .. "d"
    local opts = { buffer = event.buf }

    vim.keymap.set("n", d2_key, "", vim.tbl_extend("force", opts, { desc = "[d]2 diagram" }))
    vim.keymap.set("n", d2_key .. "t", "<cmd>D2PreviewToggle<cr>", vim.tbl_extend("force", opts, { desc = "[t]oggle" }))
    vim.keymap.set("n", d2_key .. "u", "<cmd>D2PreviewUpdate<cr>", vim.tbl_extend("force", opts, { desc = "[u]pdate" }))
    vim.keymap.set("n", d2_key .. "v", "<cmd>D2PreviewSelection<cr>", vim.tbl_extend("force", opts, { desc = "Pre[v]iew selection" }))
    vim.keymap.set("n", d2_key .. "r", "<cmd>D2ReplaceSelection<cr>", vim.tbl_extend("force", opts, { desc = "[r]eplace selection with ascii" }))
    vim.keymap.set("n", d2_key .. "a", "<cmd>D2AsciiToggle<cr>", vim.tbl_extend("force", opts, { desc = "[a]utomatic ASCII rendering on save" }))
    vim.keymap.set("n", d2_key .. "p", "<cmd>D2Playground<cr>", vim.tbl_extend("force", opts, { desc = "[p]layground" }))
  end,
})

return {}
