-- lazy.nvim
return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        statuscolumn = { enabled = false },
        picker = {
            sources = {
                explorer = { hidden = true },
            },
        },
    },
}
