return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    opts = function()
        vim.keymap.set({ "n", "v" }, "<Space>Ac", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
        vim.keymap.set(
            { "n", "v" },
            "<Space>Aa",
            "<cmd>CodeCompanionChat Toggle<cr>",
            { noremap = true, silent = true }
        )
        vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

        return {

            -- your usual adapter + strategies …
            memory = {
                opts = {
                    chat = {
                        enabled = true, -- enable memory/context
                        default_memory = "workspace", -- name of group
                    },
                },
                workspace = {
                    description = "Current project workspace",
                    files = { "**/*.cs", "**/*.py", "**/*.html", "**/*.md", "**/*.yml" }, -- glob all files recursively
                },
            },
            strategies = {
                chat = {
                    tools = {
                        file_search = { enabled = true },
                        read_file = { enabled = true },
                        insert_edit_into_file = { enabled = true, requires_approval = false },
                    },
                    -- adapters = "copilot",
                },
            },

            opts = {
                log_level = "DEBUG",
            },

            display = {
                action_palette = {
                    width = 95,
                    height = 10,
                    prompt = "Prompt ", -- Prompt used for interactive LLM calls
                    provider = "default", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
                    opts = {
                        show_default_actions = true, -- Show the default actions in the action palette?
                        show_default_prompt_library = true, -- Show the default prompt library in the action palette?
                        title = "CodeCompanion actions", -- The title of the action palette
                    },
                },
            },
        }
    end,
}
