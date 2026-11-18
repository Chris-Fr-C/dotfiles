local container = require 'custom.config.keymap-containers'

-- Easily seing all diagnostics.
vim.pack.add {
  'https://github.com/Kurama622/clean-diagnostic',
}

local diag = require 'clean-diagnostic'
diag.setup {
  border = 'rounded',
  min_severity = 4,
  max_width = 78,
  always_show_message = true,
}
vim.keymap.set('n', container.local_leader.key .. 'd', diag.show, { desc = 'Show diagnostic' })





-- Inlining the diagnostics
vim.pack.add{
    "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
}


require("tiny-inline-diagnostic").setup()
vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics

return {}
