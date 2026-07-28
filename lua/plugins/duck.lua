return {
	"tamton-aquib/duck.nvim",
	config = function()
		vim.api.nvim_create_user_command("Duck", function(opts)
			require("duck").hatch(opts.args ~= "" and opts.args or "🦆")
		end, {
			nargs = "?",
		})

		vim.api.nvim_create_user_command("DuckCook", function()
			require("duck").cook()
		end, {})

		require("duck").setup({})
	end,
}
