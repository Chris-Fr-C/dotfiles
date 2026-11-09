local containers = require("custom.config.keymap-containers")


vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

local oil = require("oil")

oil.setup({
	default_file_explorer = false,
	columns = {
		"icon",
		"permissions",
		"size",
		"mtime",
	},
	-- Show files and directories that start with "."
	show_hidden = true,
})


vim.keymap.set("n", containers.open.key .. "o", oil.open_float, { desc =  "[o]il explorer" })
