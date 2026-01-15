return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        event = "VeryLazy",
        opts = {
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-\>]], -- optional: keep LazyVim's default too
            hide_numbers = true,
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            direction = "float", -- ← this is the important part!
            close_on_exit = true,
            shell = vim.o.shell,
            float_opts = {
                border = "rounded", -- or "curved", "single", "shadow"
                winblend = 0,
                highlights = {
                    border = "Normal",
                    background = "Normal",
                },
            },
        },
        keys = {
            { "<F4>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" },
            { "<F4>", "<C-\\><C-n><cmd>ToggleTerm<cr>", mode = "t", desc = "Toggle floating terminal" },
        },
    },
}
