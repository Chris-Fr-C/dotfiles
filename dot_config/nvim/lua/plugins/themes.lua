local transparency_enabled = true

return {
    -- https://vimcolorschemes.com/folke/tokyonight.nvim
    { "scottmckendry/cyberdream.nvim" }, -- Best
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = transparency_enabled,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                auto_integrations = true,
                transparent_background = transparency_enabled,

                float = {
                    transparent = transparency_enabled, -- enable transparent floating windows
                    solid = false, -- use solid styling for floating windows, see |winborder|
                },
            })
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        -- https://neoland.dev/color-schemes
    },
    {
        "eldritch-theme/eldritch.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "bluz71/vim-moonfly-colors" },
    { "protesilaos/modus-themes" },

    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
    { "sainnhe/gruvbox-material" },
    { "ayu-theme/ayu-vim" },

    { "endel/vim-github-colorscheme" },
    { "cocopon/iceberg.vim" },
    { "NLKNguyen/papercolor-theme" }, -- Good
    { "jonathanfilip/vim-lucius" },
    { "mkarmona/materialbox" },
    { "mkarmona/colorsbox" },
    { "mswift42/vim-themes" },
    { "haystackandroid/vimspectr" },
    { "jaredgorski/SpaceCamp" },
    { "sainnhe/sonokai" },
    { "junegunn/seoul256.vim" },
    { "kyoz/purify" },
    { "fcpg/vim-orbital" },
    { "sonph/onehalf" },
    { "rakr/vim-one" },

    { "sugiura-hiromiti/newt.nvim" },
    { "PoXel6/nvtheme.nvim" },
    { "sugiura-hiromiti/primary.nvim" },
    { "vinitkumar/monokai-pro-vim" }, -- Good

    { "d-dudas/bearded.nvim" },
    { "edeneast/nightfox.nvim" },
    { "projekt0n/github-nvim-theme" }, -- Good
    { "cocopon/iceberg.vim" },
    { "w0ng/vim-hybrid" },
    { "mhartington/oceanic-next" },
    { "sainnhe/edge" }, -- Good
    { "rmehri01/onenord.nvim" },
    { "kristijanhusak/vim-hybrid-material" },
    { "shatur/neovim-ayu" },
    { "jonathanfilip/vim-lucius" },
    { "ramojus/mellifluous.nvim" },
    { "cormacrelf/vim-colors-github" }, -- Good
    { "miikanissi/modus-themes.nvim" },
    { "hzchirs/vim-material" },
    { "freeo/vim-kalisi" },
    { "ntbbloodbath/doom-one.nvim" },
    { "ishan9299/modus-theme-vim" },
    { "liuchengxu/space-vim-theme" },
    { "projekt0n/caret.nvim" },
    { "ntbbloodbath/sweetie.nvim" },
    { "yasukotelin/shirotelin" }, -- Good
    { "sontungexpt/witch" },
    { "talha-akram/noctis.nvim" },
    { "oonamo/ef-themes.nvim" }, -- Good
    { "skardyy/makurai-nvim" },
    { "john2x/flatui.vim" },
    { "spf13/vim-colors" },
    { "lifepillar/vim-wwdc17-theme" },
    { "yous/vim-open-color" },
    { "deparr/tairiki.nvim" }, -- Good
    { "marko-cerovac/material.nvim" },
}
