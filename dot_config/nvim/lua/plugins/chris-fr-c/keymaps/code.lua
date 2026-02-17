-- Making sure that x deletes without putting it to the register.
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true })

-- Overseer template

vim.keymap.set("n", "<leader>ot", function()
  require("overseer").run_template()
end, { desc = "Run Overseer Task Template" })

-- Prevent paste from overwriting the clipboard
-- Especially useful when pasting over visual selections

local opts = { noremap = true, silent = true }

-- Visual mode: paste without yanking replaced text
vim.keymap.set("x", "p", '"_dP', opts)

-- Optional: also handle capital P
vim.keymap.set("x", "P", '"_dP', opts)

-- If you use Ctrl+Shift+V inside Neovim to paste,
-- make it behave the same way in visual mode
vim.keymap.set("x", "<C-S-v>", '"_dP', opts)

-- Hotkey to choose SQL dialect for current buffer
vim.keymap.set("n", "<leader>cL", function()
  local dialects = {
    "ansi",
    "bigquery",
    "clickhouse",
    "db2",
    "duckdb",
    "hive",
    "mariadb",
    "mysql",
    "plsql",
    "postgresql",
    "redshift",
    "snowflake",
    "spark",
    "sqlite",
    "sql",
    "transactsql",
    "tsql",
    "vertica",
  }

  vim.ui.select(dialects, { prompt = "Select SQLFluff dialect:" }, function(choice)
    if choice then
      vim.b.sql_dialect = choice
      vim.notify("SQLFluff dialect set to: " .. choice, vim.log.levels.INFO)
    end
  end)
end, { desc = "Set SQLFluff SQL dialect" })

return {}
