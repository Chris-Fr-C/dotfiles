-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

vim.pack.add { 'https://github.com/lewis6991/gitsigns.nvim' }

local containers = require("custom.config.keymap-containers")

require('gitsigns').setup {
  on_attach = function(bufnr)
    local gitsigns = require 'gitsigns'

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal { ']c', bang = true }
      else
        gitsigns.nav_hunk 'next'
      end
    end, { desc = 'Jump to next git [c]hange' })

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal { '[c', bang = true }
      else
        gitsigns.nav_hunk 'prev'
      end
    end, { desc = 'Jump to previous git [c]hange' })

    -- Actions
    -- visual mode
    map('v', containers.git.key .. 'h', "", { desc = 'git hunk' })
    map('v', containers.git.key .. 'hs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [s]tage hunk' })
    map('v', containers.git.key..'hr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'git [r]eset hunk' })
    -- normal mode
    map('n', containers.git.key .. 'hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
    map('n', containers.git.key .. 'hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
    map('n', containers.git.key .. 'hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
    map('n', containers.git.key .. 'hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
    map('n', containers.git.key .. 'hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
    map('n', containers.git.key .. 'hi', gitsigns.preview_hunk_inline, { desc = 'git preview hunk [i]nline' })
    map('n', containers.git.key .. 'hb', function() gitsigns.blame_line { full = true } end, { desc = 'git [b]lame line' })
    map('n', containers.git.key .. 'hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
    map('n', containers.git.key .. 'hD', function() gitsigns.diffthis '@' end, { desc = 'git [D]iff against last commit' })
    map('n', containers.git.key .. 'hQ', function() gitsigns.setqflist 'all' end, { desc = 'git hunk [Q]uickfix list (all files in repo)' })
    map('n', containers.git.key .. 'hq', gitsigns.setqflist, { desc = 'git hunk [q]uickfix list (all changes in this file)' })
    -- Toggles
    map('n', containers.git.key .. 'tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
    map('n', containers.git.key .. 'tw', gitsigns.toggle_word_diff, { desc = '[T]oggle git intra-line [w]ord diff' })

    -- Text object
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
  end,
}
