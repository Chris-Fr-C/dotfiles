return {
    "max397574/better-escape.nvim",
    lazy = false,
    config = function()
        require("better_escape").setup({
            -- Add your custom configuration here if needed
            -- For example:
            mappings = {
                i = {
                    a = { a = "<Esc>" },
                    -- s = { s = "<Esc>" },
                    j = { j = "<Esc>" },
                    k = { k = "<Esc>" },
                    h = { h = "<Esc>" },
                },
            },
        })
    end,
}
