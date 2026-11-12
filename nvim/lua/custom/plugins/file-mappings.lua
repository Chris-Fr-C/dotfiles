local containers = require("custom.config.keymap-containers")
-- Open the current file in VisiData (or DuckDB for .duckdb files) on demand
vim.keymap.set("n", containers.open.key .. "v", function()
  local raw_file = vim.api.nvim_buf_get_name(0)

  if raw_file == "" then
    vim.notify("No file associated with the current buffer", vim.log.levels.WARN)
    return
  end

  local file = vim.fn.fnameescape(raw_file)
  local ext = vim.fn.fnamemodify(raw_file, ":e"):lower()

  -- Choose command based on extension
  local cmd = (ext == "duckdb") and "duckdb " or "vd "

  -- Open in Neovim's embedded terminal (use `enew | terminal ...` if you want to keep the raw text buffer open in the background)
  vim.cmd("terminal " .. cmd .. file)
  vim.bo.buflisted = true
  vim.cmd("startinsert")
end, { desc = "Open current file in VisiData / DuckDB" })

return {}
