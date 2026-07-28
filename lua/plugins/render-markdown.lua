return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown" },

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-mini/mini.nvim",
	},

	opts = {
		render_modes = true,

		heading = {
			enabled = true,
			sign = false,
			position = "middle",
			icons = {
				"● ",
				"◉ ",
				"○ ",
				"◌ ",
				"▪ ",
				"▫ ",
			},
			backgrounds = {},
		},

		code = {
			enabled = true,
			sign = true,

			style = "language",

			conceal_delimiters = true,

			language = true,
			language_icon = true,
			language_name = true,
			language_info = true,

			position = "middle",

			width = "block",
			border = "none",

			language_border = "",
			language_left = "",
			language_right = "",

			left_pad = 0,
			right_pad = 0,

			backgrounds = {},
		},

		bullet = {
			enabled = true,
			icons = {
				"•",
				"◦",
				"▪",
				"▫",
			},
		},

		checkbox = {
			enabled = true,
			unchecked = { icon = "󰄱" },
			checked = { icon = "󰄲" },
		},

		dash = {
			enabled = true,
		},

		quote = {
			enabled = true,
			icon = "▋",
		},

		html = {
			enabled = true,
		},

		inline_highlight = {
			enabled = true,
		},
	},
	config = function(_, opts)
		require("render-markdown").setup(opts)

		vim.api.nvim_set_hl(0, "RenderMarkdownCode", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "RenderMarkdownCodeBorder", { bg = "NONE" })
	end,
}
