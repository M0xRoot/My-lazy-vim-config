return {
    -- Highlight colors
    {
        "nvim-mini/mini.hipatterns",
        event = "BufReadPre",
        opts = {},
    },
    {
        "nvim-telescope/telescope.nvim",
        priority = 1000,
        dependencies = {
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            "nvim-telescope/telescope-file-browser.nvim",
        },
        keys = {
            {
                ";f",
                function()
                    require("telescope.builtin").find_files({ no_ignore = false, hidden = true })
                end,
                desc = "Lists files in your current working directory, respects .gitignore",
            },
            {
                ";r",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = "Search for a string in your current working directory, live results",
            },
            {
                "\\\\",
                function()
                    require("telescope.builtin").buffers()
                end,
                desc = "Lists open buffers",
            },
            {
                ";;",
                function()
                    require("telescope.builtin").resume()
                end,
                desc = "Resume previous picker",
            },
            {
                ";e",
                function()
                    require("telescope.builtin").diagnostics()
                end,
                desc = "List diagnostics",
            },
            {
                ";s",
                function()
                    require("telescope.builtin").treesitter()
                end,
                desc = "List Treesitter symbols",
            },
            {
                "sf",
                function()
                    local telescope = require("telescope")
                    local function telescope_buffer_dir()
                        return vim.fn.expand("%:p:h")
                    end
                    telescope.extensions.file_browser.file_browser({
                        path = "%:p:h",
                        cwd = telescope_buffer_dir(),
                        respect_gitignore = false,
                        hidden = true,
                        grouped = true,
                        previewer = false,
                        initial_mode = "normal",
                        layout_config = { height = 40 },
                    })
                end,
                desc = "Open File Browser at current buffer path",
            },
        },
        config = function(_, opts)
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local fb_actions = telescope.extensions.file_browser.actions

            opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
                wrap_results = true,
                layout_strategy = "horizontal",
                layout_config = { prompt_position = "top" },
                sorting_strategy = "ascending",
                winblend = 0,
                mappings = { n = {} },
            })

            opts.pickers = {
                diagnostics = {
                    theme = "ivy",
                    initial_mode = "normal",
                    layout_config = { preview_cutoff = 9999 },
                },
            }

            opts.extensions = {
                file_browser = {
                    theme = "dropdown",
                    hijack_netrw = true,
                    mappings = {
                        n = {
                            N = fb_actions.create,
                            h = fb_actions.goto_parent_dir,
                            ["<C-u>"] = function(prompt_bufnr)
                                for i = 1, 10 do
                                    actions.move_selection_previous(prompt_bufnr)
                                end
                            end,
                            ["<C-d>"] = function(prompt_bufnr)
                                for i = 1, 10 do
                                    actions.move_selection_next(prompt_bufnr)
                                end
                            end,
                        },
                    },
                },
            }

            telescope.setup(opts)
            telescope.load_extension("fzf")
            telescope.load_extension("file_browser")
        end,
    },
}
