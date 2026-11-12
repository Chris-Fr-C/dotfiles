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
    view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
    },
    keymaps = {
        ["<BS>"] = "actions.parent",
        ["."] = "actions.cd",
    },
})

vim.keymap.set("n", containers.open.key .. "o", oil.open, { desc = "Oil explorer" })
