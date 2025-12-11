vim.keymap.set("n", "q", "<Nop>", { desc = "Disable macro recording" })
vim.keymap.set("n", "Q", "<Nop>", { desc = "Disable Ex mode" })

-- Copy paste

-- Enable clipboard integration between WSL & Windows
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = [[powershell.exe -NoProfile -Command "Get-Clipboard"]],
      ["*"] = [[powershell.exe -NoProfile -Command "Get-Clipboard"]],
    },
    cache_enabled = 0,
  }
end

return {}
