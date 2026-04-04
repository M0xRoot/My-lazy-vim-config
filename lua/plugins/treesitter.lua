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
                "ninja",
                "rst",
                "php",
                "tsx",
                "jsx",
                "blade",
                "html",
            },
            indent = {
                enable = true,
            },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = {
                    "vue",
                    "html",
                    "jsx",
                    "tsx",
                    "css",
                    "scss",
                    "javascript",
                    "typescript",
                },
            },
            query_linter = {
                enable = true,
                use_virtual_text = true,
                lint_events = { "BufWrite", "CursorHold" },
            },
        },
    },
}
