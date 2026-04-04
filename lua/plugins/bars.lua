return {
    {
        "OXY2DEV/bars.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("bars").setup({
                winbar = {
                    enabled = true,
                    separator = "",

                    -- left and right padding
                    left_pad = 1,
                    right_pad = 1,

                    -- highlight groups for components
                    highlight = {
                        active = "WinBarActive",
                        inactive = "WinBarInactive",
                    },
                },
            })
        end,
    },
}
