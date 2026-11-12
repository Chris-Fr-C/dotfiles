# AGENTS.md — Neovim Configuration Guidelines

This document defines the architecture, conventions, and strict rules that AI agents and contributors must follow when modifying this Neovim configuration.

## Core Philosophy & Environment

Target Version: Neovim >= 0.12 (leveraging native vim.pack, vim.lsp.config, vim.lsp.enable, and :restart).

Package Manager: ONLY use Neovim's built-in vim.pack.add().

STRICT PROHIBITION: Do NOT introduce lazy.nvim, packer.nvim, rocks.nvim, mini.deps, or any third-party plugin manager.

Lockfile management is handled natively via nvim-pack-lock.json at the root of the configuration directory.

Modularity: Keep configuration decoupled. Each plugin lives in its own file, and all keybindings route through centralized keymap containers.

## Directory Structure

All configuration files must adhere strictly to this layout:
```
nvim/
├── AGENTS.md                 # This file
├── init.lua                  # Entry point (loads config/* and plugins/*)
├── nvim-pack-lock.json       # Native vim.pack lockfile (version controlled)
└── lua/custom
    ├── config/
    │   ├── options.lua       # Core vim.opt / vim.g settings (must load first)
    │   ├── core.lua          # Reusable helpers & keymap root containers
    │   ├── keymaps.lua       # General, non-plugin-specific keybindings
    │   └── autocmds.lua      # Global autocommands and augroups
    ├── snipets/              # Snippet files
    └── plugins/
        ├── lsp.lua           # Native LSP configuration & servers
        ├── treesitter.lua    # Treesitter setup
        ├── telescope.lua     # Telescope setup & Telescope-specific keymaps
        ├── lazygit.lua       # Lazygit setup & Lazygit-specific keymaps
        └── <plugin>.lua      # One file per plugin/domain
```

### Load Order in init.lua

require("config.options") — Must execute first so vim.g.mapleader and vim.g.maplocalleader are defined before any keymaps or plugins are registered.

require("config.core") — Initializes keymap root containers and registers UI prefix descriptions (e.g., for which-key).

require("config.keymaps") — Sets general editor keymaps.

require("config.autocmds") — Sets global autocommands.

lua/plugins/*.lua — Loaded either explicitly or via directory iteration in init.lua.

## Package Management Rules (vim.pack.add)

Co-location: Declare vim.pack.add({ ... }) directly at the top of the corresponding lua/plugins/<plugin>.lua file right before calling its .setup() or configuration logic.

Dependencies: Include plugin dependencies inside the same vim.pack.add() table (e.g., plenary.nvim inside telescope.lua). vim.pack.add() safely deduplicates plugins added across multiple files.

Specification Format: Use full repository URLs or valid vim.pack spec tables:
```lua
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  {
    src = "https://github.com/nvim-telescope/telescope.nvim",
    version = vim.version.range("0.1.*"), -- Optional version constraint
  },
})
```


Lazy Loading: Prefer Neovim's native event-driven patterns (vim.api.nvim_create_autocmd with once = true on FileType, BufReadPre, or InsertEnter) or load = false with explicit vim.cmd.packadd() only when startup profiling proves it necessary.

### Keymap Container Architecture (lua/config/core.lua)

Concept

All leader-based and grouped keymaps must consume prefixes from the root containers table exported by lua/config/core.lua (or the dedicated module re-exported by core.lua). Hardcoding <leader>f... or <leader>g... inside plugin files is forbidden.

Container Definition Standard

lua/config/core.lua maintains the single source of truth for keymap prefixes:
```lua
local local_leader = ","

local containers = {
  local_leader = { key = local_leader, desc = "Local leader", alias = true },
  find         = { key = "<leader>f",  desc = "find" },
  git          = { key = "<leader>g",  desc = "git", alias = true },
  lsp          = { key = "<leader>l",  desc = "lsp" },
  code         = { key = "<leader>c",  desc = "code", alias = true },
  debug        = { key = "<leader>d",  desc = "debug" },
  terminal     = { key = "<leader>t",  desc = "terminal" },
  org          = { key = "<leader>o",  desc = "org" },
  window       = { key = "<leader>w",  desc = "window" },
  open         = { key = "<leader><leader>", desc = "open" },
  root         = { key = "", desc = "" }, -- Sentinel for LSP/linter reference tracking
}

-- Automatically register root group descriptions for UI menu plugins (e.g., which-key)
for _, target in pairs(containers) do
  if target.key ~= "" and not target.alias then
    vim.keymap.set("n", target.key, "", { desc = target.desc })
  end
end

return {
  containers = containers,
  -- Additional shared utility functions live here
}
```

## Keymap Rules for Agents

No Hardcoded Prefixes: Always import containers from config.core and concatenate keys:

local core = require("config.core")
local c = core.containers

vim.keymap.set("n", c.open.key .. "k", builtin.keymaps, { desc = "keymaps" })
vim.keymap.set("n", c.find.key .. "f", builtin.find_files, { desc = "find files" })


Co-location:

Plugin-specific keymaps belong inside lua/plugins/<plugin>.lua, immediately below that plugin's setup() call.
jkjgg
General editor keymaps (window navigation, buffer movement, yank/paste helpers) belong in lua/config/keymaps.lua.

Buffer-Local LSP Keymaps: Inside lua/plugins/lsp.lua, attach c.lsp and c.code keymaps inside an LspAttach autocommand using { buffer = event.buf, desc = "..." }.

Descriptions Required: Every vim.keymap.set call must include a concise, lowercase desc field in the options table.

New Categories: If a plugin introduces a distinct workflow not covered by existing containers, propose adding a new entry to containers in lua/config/core.lua rather than inventing an ad-hoc prefix.

5. Code Style & Lua Conventions

Formatting: 2-space indentation, double quotes " preferred for strings, trailing commas in multi-line tables.

LSP & Diagnostics: Keep code clean for lua_ls (Lua Language Server). Use vim.api.*, vim.keymap.set, and vim.uv (rather than deprecated vim.loop).

Safety: Guard optional require() calls with pcall if a plugin might be conditionally disabled, though standard vim.pack.add() calls guarantee runtime availability immediately after execution.

No Dead Code: Remove unused variables or obsolete lazy.nvim spec keys (dependencies, opts, keys, event, cmd) when migrating or creating plugin files.

6. Agent Workflow Checklist

Before finalizing any change to this repository, verify:

[ ] Does the change use vim.pack.add() instead of lazy.nvim syntax?

[ ] Is the plugin isolated in lua/plugins/<plugin>.lua?

[ ] Are all plugin keymaps defined inside lua/plugins/<plugin>.lua?

[ ] Do all grouped keymaps reference containers.<group>.key from config.core?

[ ] Does every vim.keymap.set include a clear desc string?

[ ] Is lua/config/options.lua loaded before any keymaps are evaluated?
