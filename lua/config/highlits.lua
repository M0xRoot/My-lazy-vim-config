local function markdown_highlights()
	vim.api.nvim_set_hl(0, "@markup.strong.markdown_inline", {
		fg = "#ff6b6b",
		bold = true,
	})

	vim.api.nvim_set_hl(0, "@markup.italic.markdown_inline", {
		fg = "#7FB4CA",
		italic = true,
	})
end

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = markdown_highlights,
})

markdown_highlights()
