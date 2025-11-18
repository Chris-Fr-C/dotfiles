-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--
--
--
-- vim.cmd("highlight Cursor guifg=white guibg=steelblue")
-- vim.cmd("highlight iCursor guifg=white guibg=tomato")
vim.cmd("set guicursor+=i:blockursor")
vim.cmd("set guicursor+=n-v-c:blinkon10")
vim.cmd("set guicursor+=i:blinkwait10")

-- Two-way system clipboard using win32yank on Windows
vim.opt.clipboard = "unnamedplus" -- use system clipboard for all yank/paste operations

vim.g.clipboard = {
    name = "win32yank",
    copy = {
        ["+"] = "win32yank -i --crlf",
        ["*"] = "win32yank -i --crlf",
    },
    paste = {
        ["+"] = "win32yank -o --lf",
        ["*"] = "win32yank -o --lf",
    },
    cache_enabled = 0,
}

-- Mode-based colors for the current line
local mode_colors = {
    n = "#27AE60", -- Normal mode color
    i = "#C0392B", -- Insert mode (red tint)
    v = "#2980B9", -- Visual mode (blue tint)
}

-- Function to update the current line highlight
local function update_cursorline_color()
    local mode = vim.fn.mode()
    local color = mode_colors[mode] or mode_colors["n"]

    -- Set CursorLine highlight dynamically
    vim.api.nvim_set_hl(0, "CursorLine", { underline = true, sp = color })
    vim.wo.cursorline = true -- enable cursorline if not already
end

-- Autocommand to update on mode change
vim.api.nvim_create_autocmd({ "ModeChanged", "VimEnter" }, {
    pattern = "*",
    callback = update_cursorline_color,
})

-- Autocommand to update on cursor move in visual mode
vim.api.nvim_create_autocmd("CursorMoved", {
    pattern = "*",
    callback = function()
        if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "\22" then
            update_cursorline_color()
        end
    end,
})
