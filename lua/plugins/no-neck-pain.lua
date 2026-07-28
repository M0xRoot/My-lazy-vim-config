return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	ft = "markdown",
	opts = {
		width = 100,
	},
	config = function(_, opts)
		require("no-neck-pain").setup(opts)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				vim.schedule(function()
					require("no-neck-pain").enable()
				end)
			end,
		})
	end,
}
