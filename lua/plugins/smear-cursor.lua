return {
	"sphamba/smear-cursor.nvim",
	opts = {
		stiffness = 0.5,
		trailing_stiffness = 0.49,
		damping = 0.6,
		trailing_exponent = 5,
		gradient_exponent = 0,

		never_draw_over_target = false,
		matrix_pixel_threshold = 0.5,

		-- Particle effects
		particles_enabled = true,
		particle_max_num = 120, -- 200 is pretty heavy

		-- Match Catppuccin Mocha blue (optional)
		-- cursor_color = "#89b4fa",

		smear_between_buffers = true,
		smear_between_neighbor_lines = true,
		scroll_buffer_space = true,

		legacy_computing_symbols_support = true,

		smear_insert_mode = true,

		-- Optional: use a vertical bar animation in insert mode
		vertical_bar_cursor_insert_mode = true,
	},
}
