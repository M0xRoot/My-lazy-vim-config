return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },

		opts = {
			options = {
				theme = "pywal",
				globalstatus = true,
				disabled_filetypes = {
					statusline = { "snacks_dashboard" },
				},
				always_divide_middle = true,

				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},

			sections = {
				lualine_a = {
					{ "mode", icon = "" },
				},

				lualine_b = {
					{ "branch", icon = "" },
					"diff",
				},

				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = "[No Name]",
						},
					},
				},

				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },

						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						},

						colored = true,
						update_in_insert = false,
						always_visible = true,
					},

					"lsp_status",
					"filetype",
				},

				lualine_y = {
					{ "progress", icon = "" },
				},

				lualine_z = {
					{ "location", icon = "" },
				},
			},
		},
	},
}
