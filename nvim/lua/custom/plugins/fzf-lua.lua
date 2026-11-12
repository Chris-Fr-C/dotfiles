local containers = require("custom.config.keymap-containers")
local style = require("custom.config.style")

vim.pack.add({
	-- Optional dep:
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/ibhagwan/fzf-lua",
})

local fzf = require("fzf-lua")
fzf.setup({
	winopts = {
		-- Adding a border helps separate the overlapping text visually
		border = style.border_style,
	},
})

vim.keymap.set("n", containers.find.key .. "f", function()
	fzf.files({ resume = false })
end, { desc = "Files" })
-- Not using <leader><leader> cause it slows down aaaall my other keymaps.

vim.keymap.set("n", containers.find.key .. "b", fzf.buffers, { desc = "Find existing buffers" })
vim.keymap.set("n", containers.find.key .. "r", fzf.resume, { desc = "Resume search" })
vim.keymap.set("n", containers.find.key .. "g", fzf.global, { desc = "Global search" })
vim.keymap.set("n", containers.find.key .. "t", fzf.treesitter, { desc = "Treesitter search" })
vim.keymap.set("n", containers.find.key .. "s", fzf.lsp_document_symbols, { desc = "LSP Symbols search" })
vim.keymap.set("n", containers.find.key .. "T", fzf.tabs, { desc = "Tabs" })
vim.keymap.set("n", containers.find.key .. "a", fzf.args, { desc = "Args" })
-- vim.keymap.set('n', containers.find.key .. 'l', fzf.lsp_live_workspace_symbols, { desc = 'Live workspace symbols' })
vim.keymap.set("n", containers.find.key .. "l", fzf.lsp_finder, { desc = "Full LSP finder" })
vim.keymap.set("n", containers.find.key .. "w", function()
	fzf.live_grep()
end, { desc = "Grep" })

return {}
