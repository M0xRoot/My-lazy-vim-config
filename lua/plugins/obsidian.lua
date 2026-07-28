return {
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*",
		ft = "markdown",

		dependencies = {
			"nvim-lua/plenary.nvim",
		},

		keys = {
			{ "<leader>on", "<cmd>ObsidianNew<CR>", desc = "New note" },
			{ "<leader>oo", "<cmd>ObsidianOpen<CR>", desc = "Open in Obsidian" },
			{ "<leader>od", "<cmd>ObsidianToday<CR>", desc = "Today's note" },
			{ "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "Backlinks" },
			{ "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", desc = "Quick switch" },
			{ "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Search" },
		},

		opts = {
			link = { { style = "markdown" } },
			ui = {
				enable = true,
				tags = {
					highlight = "PurpleItalic",
				},
			},
			workspaces = {
				{
					name = "vault",
					path = "~/Notes/Vault/",
				},
			},
			templates = {
				folder = "Templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
			},
			notes_subdir = "Notes",

			daily_notes = {
				folder = "Daily",
				date_format = "%Y-%m-%d",
				alias_format = "%B %-d, %Y",
			},

			completion = {
				min_chars = 2,
			},

			legacy_commands = false,
			new_notes_location = "notes_subdir",
		},
		config = function(_, opts)
			require("obsidian").setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.schedule(function()
						vim.diagnostic.enable(false, { bufnr = 0 })
						vim.opt_local.spell = false
					end)
				end,
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		opts = {
			linters = {
				["markdownlint-cli2"] = {
					args = { "--config", vim.fn.expand("~/Notes/Vault/.markdownlint.jsonc"), "--" },
				},
			},
		},
	},
}
