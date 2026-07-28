return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPre", "BufNewFile" },

	opts = {
		-- render = "foreground",
		render = "background", -- to highlight text background
		enable_named_colors = true,
		enable_tailwind = true,
	},

	config = function(_, opts)
		require("nvim-highlight-colors").setup(opts)
	end,
}
