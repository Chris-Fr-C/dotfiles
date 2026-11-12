local local_leader = ","

-- This changes often based on my tastes. So we make it a variable that we can use and
-- append based on the organisation we want.
local containers = {
	local_leader = { key = local_leader, desc = "Local leader", alias = true },

	quit = { key = "<leader>q", desc = "Quit" },
	find = { key = "<leader>f", desc = "Find" },
	git = { key = "<leader>g", desc = "Git", alias = false },

	lsp = { key = "<leader>c", desc = "Code" },
	code = { key = "<leader>c", desc = "Code", alias = true },

	evaluate = { key = local_leader .. "e", desc = "Evaluate" },
	diagnostic = { key = "<leader>ct", desc = "Troubles diagnostic" },
	build = { key = "<leader>b", desc = "Build" },
	execute = { key = "<leader>x", desc = "Execute" },
	debug = { key = "<leader>d", desc = "Debug" },

	open = { key = "<leader><leader>", desc = "Open", alias = false },
	visualize = { key = "<leader><leader>", desc = "", alias = true }, -- just here so the linter helps us to know where it is used.
	config = { key = "<leader><leader>c", desc = "Config" },
	config_vim = { key = "<leader><leader>cv", desc = "Vim config" },
	generate = { key = "<leader><leader>g", desc = "Generate" },

	-- Not using obsidian for the moment
	-- obsidian = {key=local_leader.."o", desc="[o]bsidian"}, -- just here so the linter helps us to know where it is used.
	terminal = { key = "<leader>t", desc = "Terminal" }, -- just here so the linter helps us to know where it is used.
	org = { key = "<leader>o", desc = "OrgMode" },
	window = { key = "<leader>w", desc = "Window" },
	root = { key = "", desc = "" }, -- just here so the linter helps us to know where it is used.
}

-- Automatically register the root descriptions for UI menus
for _, target in pairs(containers) do
	if target.key ~= "" and not target.alias then
		vim.keymap.set("n", target.key, "", { desc = target.desc })
	end
end

return containers
