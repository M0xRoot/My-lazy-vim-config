return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "javascript",
                "typescript",
                "css",
                "graphql",
                "http",
                "json",
                "scss",
                "sql",
                "vim",
                "lua",
                "vue",
                "copilot",
                "ninja",
                "rst",
            },
            indent = {
                enable = true,
                disable = { "html", "vue", "javascript" },
            },

            highlight = {
                enable = true,
                -- optional: helps with some edge cases
                additional_vim_regex_highlighting = { "vue" },
            },
            query_linter = {
                enable = true,
                use_virtual_text = true,
                lint_events = { "BufWrite", "CursorHold" },
            },
        },
    },
}
