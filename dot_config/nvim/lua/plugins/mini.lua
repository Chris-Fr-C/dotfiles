if true then
    return {}
end

-- Bundle of good plugins
return {
    {
        "nvim-mini/mini.nvim",
        version = "*",
        config = function()
            local modules = {
                "ai",
                "animate",
                "base16",
                "bufremove",
                "clue",
                "colors",
                "completion",
                "cursorword",
                "doc",
                "extra",
                "fuzzy",
                "hipatterns",
                "hues",
                "icons",
                "indentscope",
                "jump",
                "map",
                "misc",
                "move",
                -- "notify",      -- conflicts with nvim-notify
                "operators",
                -- "pairs",       -- conflicts with nvim-autopairs
                "pick",
                -- "comment",     -- conflicts with Comment.nvim
                -- "files",       -- conflicts with neo-tree
                -- "statusline",  -- conflicts with lualine.nvim
                -- "tabline",     -- conflicts with bufferline.nvim
                -- "sessions",    -- conflicts with persistence.nvim
                "splitjoin",
                "starter",
                "test",
                "trailspace",
                "visits",
            }
            vim.b.minipairs_disable = true
            for _, name in ipairs(modules) do
                local ok, mod = pcall(function()
                    return require("mini." .. name)
                end)
                if ok and mod and mod.setup then
                    pcall(function()
                        mod.setup()
                    end)
                end
            end
            -- No autopairs
            require("mini.pairs").setup({ modes = { insert = false, command = false, terminal = false } })
        end,
    },
}
