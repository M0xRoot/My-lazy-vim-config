return {
    {
        "sainnhe/sonokai",
        priority = 1000,
        lazy = false,
        config = function()
            vim.g.sonokai_transparent_background = "1"
            vim.g.sonokai_enable_italic = "1"
            vim.g.sonokai_style = "andromeda"
            vim.cmd.colorscheme("sonokai")
            vim.cmd([[
                " Normal text background
                hi Normal guibg=NONE ctermbg=NONE
                hi NormalNC guibg=NONE ctermbg=NONE

                " Floating windows
                hi NormalFloat guibg=NONE ctermbg=NONE
                hi FloatBorder guibg=NONE ctermbg=NONE

                " Command-line popups / completion menu
                hi Pmenu guibg=NONE ctermbg=NONE
                hi PmenuSel guibg=NONE ctermbg=NONE
                hi PmenuThumb guibg=NONE ctermbg=NONE

                " Telescope windows (if installed)
                hi TelescopeNormal guibg=NONE ctermbg=NONE
                hi TelescopeBorder guibg=NONE ctermbg=NONE
                hi TelescopePrompt guibg=NONE ctermbg=NONE
                hi TelescopePromptBorder guibg=NONE ctermbg=NONE

                " Lazy.nvim windows
                hi FloatTitle guibg=NONE ctermbg=NONE
                hi LazyNormal guibg=NONE ctermbg=NONE
                hi LazyButton guibg=NONE ctermbg=NONE

                " Line numbers
                hi LineNr guifg=#5a5a5a
                hi CursorLineNr guifg=#ff9e64
            ]])
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
        -- priority = 1000,
        lazy = true,
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
