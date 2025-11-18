return {

    "NickvanDyke/opencode.nvim",
    dependencies = {
        -- Recommended for `ask()` and `select()`.
        -- Required for default `toggle()` implementation.
        { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
        ---@type opencode.Opts
        vim.g.opencode_opts = {
            -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition".
        }

        -- Required for `opts.auto_reload`.
        vim.o.autoread = true

        -- Recommended/example keymaps.
        vim.keymap.set({ "n" }, "<Space>ac", function()
            require("opencode").toggle()
        end)
    end,
}
