-- Colored modes
-- lua/plugins/mode_line_colors.lua
return {
  {
    "rasulomaroff/reactive.nvim",
    lazy = false,
    config = function()
      local reactive = require("reactive")

      reactive.add_preset({
        name = "custom-mode-line",
        init = function()
          vim.opt.termguicolors = true
          -- Define a custom cursor highlight group
          vim.opt.guicursor:append(
            "n-v-c:block-ModeCursor,i-ci-ve:ver25-ModeCursor,r-cr:hor20-ModeCursor,o:hor50-ModeCursor"
          )
        end,
        modes = {
          -- Normal mode: light blue line, much darker blue cursor
          n = {
            winhl = { CursorLine = { bg = "#90D5FF" } }, -- light blue line
            hl = { ModeCursor = { bg = "#00FF00" } }, -- much darker blue cursor
          },

          -- Insert mode: light red line, dark red cursor
          i = {
            winhl = { CursorLine = { bg = "#f5d6d6" } }, -- light red line
            hl = { ModeCursor = { bg = "#800000" } }, -- dark red cursor
          },

          -- Delete mode (Replace 'R'): light orange line, darker orange cursor
          R = {
            winhl = { CursorLine = { bg = "#f5e0d6" } }, -- light orange line
            hl = { ModeCursor = { bg = "#d2691e" } }, -- darker orange cursor
          },

          -- Replace mode (command 'c'): light orange line, darker orange cursor
          c = {
            winhl = { CursorLine = { bg = "#f5e0d6" } }, -- light orange line
            hl = { ModeCursor = { bg = "#d2691e" } }, -- darker orange cursor
          },

          -- Visual modes (v, V, block): pastel purple line, much darker cursor
          [{ "v", "V", "\x16" }] = {
            winhl = { CursorLine = { bg = "#e6d6f5" } }, -- pastel purple line
            hl = { ModeCursor = { bg = "#5a2e80" } }, -- much darker purple cursor
          },
        },
      })

      reactive.setup({
        configs = { ["custom-mode-line"] = true },
        builtin = {
          cursorline = true, -- keep cursorline always enabled
          cursor = false, -- we use custom cursor color
          modemsg = false,
        },
      })
    end,
  },
}
