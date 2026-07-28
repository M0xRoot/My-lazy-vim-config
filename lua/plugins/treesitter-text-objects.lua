return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	event = { "BufReadPre", "BufNewFile" },

	opts = {
		textobjects = {
			select = {
				enable = true,
				lookahead = true,

				keymaps = {
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",

					["af"] = "@function.outer",
					["if"] = "@function.inner",

					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},

			move = {
				enable = true,
				set_jumps = true,

				goto_next_start = {
					["]f"] = "@function.outer",
					["]c"] = "@class.outer",
				},

				goto_previous_start = {
					["[f"] = "@function.outer",
					["[c"] = "@class.outer",
				},
			},
		},
	},
}
