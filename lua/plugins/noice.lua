return {
    "folke/noice.nvim",
    event = "VeryLazy",

    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },

    config = function()
        require("noice").setup({
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
            },

            popupmenu = {
                enabled = true,
                backend = "nui",
                kind_icons = {},
            },

            views = {
                cmdline_popup = {
                    position = {
                        row = "40%",
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                    border = {
                        style = "rounded",
                    },
                },
            },

            messages = {
                enabled = true,
                view_search = "virtualtext",
            },

            presets = {
                bottom_search = false,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = true,
            },
        })
    end,
}
