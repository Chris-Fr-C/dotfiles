if true then
    return {}
end
return {
    "danymat/neogen",
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*",
    config = function()
        require("neogen").setup({
            snippet_engine = "nvim",
            enabled = true, --if you want to disable Neogen
            input_after_comment = true,
            languages = {
                python = {
                    template = {
                        annotation_convention = "google_docstrings", -- for a full list of annotation_conventions, see supported-languages below,
                    },
                },
            },
        })
    end,
}
