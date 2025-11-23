-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- WSL clipboard support using clip.exe
local clip = "/mnt/c/Windows/System32/clip.exe" -- adjust if your C drive is mounted differently

if vim.fn.executable(clip) == 1 then
    vim.api.nvim_create_augroup("WSLYank", { clear = true })

    vim.api.nvim_create_autocmd("TextYankPost", {
        group = "WSLYank",
        callback = function()
            -- Only send to clipboard if @0 is not empty
            local text = vim.fn.getreg("0")
            if text ~= "" then
                vim.fn.system(clip, text)
            end
        end,
    })
end

-- Enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Keep at the same indentation when new line
vim.o.autoindent = true
vim.o.smartindent = true -- optional
