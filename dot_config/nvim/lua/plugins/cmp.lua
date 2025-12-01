if true then
    return {}
end

return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        lazy = false,
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
        opts = function() --  Cmp suggestions
            local cmp = require("cmp")

            vim.keymap.set({ "i", "n" }, "<C-Space>", function()
                cmp.complete()
            end, { desc = "Show cmp suggestions" })

            cmp.setup({
                mapping = {
                    ["<Up>"] = cmp.mapping.select_prev_item(),
                    ["<Down>"] = cmp.mapping.select_next_item(),
                    -- ["p"] = cmp.mapping.select_prev_item(),
                    ["<Shift-Tab>"] = cmp.mapping.select_next_item(),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<q>"] = cmp.mapping.close(),
                },
                completion = {
                    completeopt = "menu,menuone,noinsert",
                    autocomplete = false,
                },
                experimental = {
                    ghost_text = false,
                },
            })

            vim.keymap.set("i", "<C-y>", function()
                cmp.confirm({ select = true })
            end, { desc = "Accept cmp suggestion" })
        end,
        -- Not all LSP servers add brackets when completing a function.
        -- To better deal with this, LazyVim adds a custom option to cmp,
        -- that you can configure. For example:
        --
        -- ```lua
        -- opts = {
        --   auto_brackets = { "python" }
        -- }
        -- ```
        -- opts = function()
        --     -- Register nvim-cmp lsp capabilities
        --     vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
        --
        --     vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = false })
        --     local cmp = require("cmp")
        --     local defaults = require("cmp.config.default")()
        --     local auto_select = true
        --     local normal_bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
        --     if normal_bg then
        --         local hex = string.format("#%06x", normal_bg)
        --         local function darken(hex, percent)
        --             local r = math.floor(tonumber(hex:sub(2, 3), 16) * percent)
        --             local g = math.floor(tonumber(hex:sub(4, 5), 16) * percent)
        --             local b = math.floor(tonumber(hex:sub(6, 7), 16) * percent)
        --             return string.format("#%02x%02x%02x", r, g, b)
        --         end
        --         local darker = darken(hex, 0.9)
        --         vim.api.nvim_set_hl(0, "CmpPmenu", { bg = darker })
        --     end
        --
        --     return {
        --         window = {
        --             completion = require("cmp").config.window.bordered({
        --                 border = "rounded",
        --                 winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSelection,Search:None",
        --                 col_offset = -3,
        --                 side_padding = 1,
        --             }),
        --             documentation = require("cmp").config.window.bordered({
        --                 border = "rounded",
        --                 winhighlight = "Normal:CmpDocNormal,FloatBorder:CmpDocBorder",
        --             }),
        --         },
        --         completion = {
        --             autocomplete = false,
        --             completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        --         },
        --         -- This aims to
        --         preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        --         sources = cmp.config.sources({
        --             { name = "lazydev" },
        --             { name = "nvim_lsp" },
        --             { name = "path" },
        --         }, {
        --             { name = "buffer" },
        --         }),
        --         experimental = {
        --             -- only show ghost text when we show ai completions
        --             -- ghost_text = vim.g.ai_cmp and {
        --             --     hl_group = "CmpGhostText",
        --             -- } or false,
        --         },
        --         sorting = defaults.sorting,
        --     }
        -- end,
        -- main = "lazyvim.util.cmp",
    },
}
