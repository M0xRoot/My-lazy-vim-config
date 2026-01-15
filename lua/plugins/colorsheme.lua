return {
    {
        "sainnhe/sonokai",
        -- priority = 1000,
        lazy = true,
        config = function()
            vim.g.sonokai_transparent_background = "1"
            vim.g.sonokai_enable_italic = "1"
            vim.g.sonokai_style = "atlantis"
            vim.cmd.colorscheme("sonokai")
        end,
    },
    {
        "catppuccin/nvim",
        lazy = true,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- closest to Sonokai Andromeda (dark & contrast)
                transparent_background = true,
                term_colors = true,
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("tokyonight").setup({
                style = "storm", -- closest to Sonokai Atlantis (dark + contrast)
                transparent = true,
                terminal_colors = true,

                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    sidebars = "transparent",
                    floats = "transparent",
                },
                on_colors = function(_) end,
                on_highlights = function(_) end,
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
}
