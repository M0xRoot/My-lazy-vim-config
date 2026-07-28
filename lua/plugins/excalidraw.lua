return {
	"marcocofano/excalidraw.nvim",

	dependencies = {
		"obsidian-nvim/obsidian.nvim",
	},

	opts = {
		storage_dir = "~/Notes/Vault/excalidraw",
		templates_dir = "~/Notes/Vault/excalidraw/templates",
		open_on_create = true,
		relative_path = true,

		picker = {
			link_scene_mapping = "<C-l>",
		},
	},
}
