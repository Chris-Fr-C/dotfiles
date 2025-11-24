-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- -- Delete current line with Ctrl+D
vim.keymap.set("n", "<Shift BS>", "_dd", { noremap = true, silent = true, desc = "Delete current line" })
vim.keymap.set("v", "<BS>", '"_d', { noremap = true, silent = true, desc = "Delete selection without yanking" })

-- Exit Neovim completely without saving when press Alt+Q
vim.keymap.set("n", "<A-q>", ":qa!<CR>", { noremap = true, silent = true, desc = "Quit all without saving" })

-- Navigate jump list (previous/next location)
-- Alt+h or Alt+Left → go back
vim.keymap.set("n", "<A-h>", "<C-o>", { noremap = true, silent = true, desc = "Jump to previous location" })
vim.keymap.set("n", "<A-Left>", "<C-o>", { noremap = true, silent = true, desc = "Jump to previous location" })

-- Alt+l or Alt+Right → go forward
vim.keymap.set("n", "<A-l>", "<C-i>", { noremap = true, silent = true, desc = "Jump to next location" })
vim.keymap.set("n", "<A-Right>", "<C-i>", { noremap = true, silent = true, desc = "Jump to next location" })

-- Folder for setup
vim.keymap.set("n", "<leader>S", "", { silent = true, noremap = true, desc = "Setup" })

-- Folder for tools
vim.keymap.set("n", "<leader>T", "", { silent = true, noremap = true, desc = "Tools" })

-- Open LazyVim dashboard with Ctrl+H
vim.keymap.set("n", "<leader>h", function()
    require("snacks.dashboard").open()
end, { desc = "Back to [H]ome (Snacks Dashboard)" })

-- Escape sequence in terminal
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

vim.keymap.set("n", "q", "<Nop>", { desc = "Disable macro recording" })
vim.keymap.set("n", "Q", "<Nop>", { desc = "Disable Ex mode" })
