return {
	{
		"saghen/blink.cmp",
		opts = {
			completion = {
				trigger = {
					show_on_keyword = true,
					show_on_trigger_character = true,
				},
				documentation = {
					auto_show = true,
				},
				ghost_text = {
					enabled = true,
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},
	},
}
