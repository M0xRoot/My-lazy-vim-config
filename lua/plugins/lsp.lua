return {
    {
        "mason-org/mason.nvim", -- note: corrected the repo name (mason-org → williamboman)
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "emmet-language-server",
                "luacheck",
                "shellcheck",
                "shfmt",
                "tailwindcss-language-server",
                "typescript-language-server", -- ← added (required by modern vue_ls)
                "vue-language-server",
                "css-lsp",
            })
        end,
    },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "vue_ls",
                "ts_ls",
                "tailwindcss",
                "cssls",
                "html",
                "lua_ls",
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = true },

            servers = {
                ruff = {
                    cmd_env = { RUFF_TRACE = "messages" },
                    init_options = {
                        settings = {
                            logLevel = "error",
                        },
                    },
                    keys = {
                        {
                            "<leader>co",
                            LazyVim.lsp.action["source.organizeImports"],
                            desc = "Organize Imports",
                        },
                    },
                },
                ruff_lsp = {
                    keys = {
                        {
                            "<leader>co",
                            LazyVim.lsp.action["source.organizeImports"],
                            desc = "Organize Imports",
                        },
                    },
                },
                emmet_language_server = {
                    filetypes = { "vue", "css", "html", "scss", "javascript" },
                    init_options = {
                        html = {
                            options = {
                                ["output.selfClosingStyle"] = "xhtml",
                            },
                        },
                        includeLanguages = {
                            vue = "html",
                        },
                        preferences = {
                            ["emmet.showExpandedAbbreviation"] = "always",
                            ["emmet.showSuggestionsAsSnippets"] = true,
                        },
                        showAbbreviationSuggestions = true,
                        showExpandedAbbreviation = "always",
                    },
                },

                intelephense = {
                    filetypes = { "php" },
                    root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
                    settings = {
                        intelephense = {
                            files = {
                                maxSize = 5000000, -- 5MB
                            },
                            environment = {
                                includePaths = {}, -- optional: add PHP include paths
                            },
                            diagnostics = {
                                enable = true,
                            },
                            completion = {
                                fullyQualifyGlobalSymbols = true,
                                includeUseStatements = true,
                                insertUseDeclaration = true,
                            },
                            format = {
                                enable = true,
                            },
                        },
                    },
                },

                vue_ls = {
                    filetypes = { "vue" },
                    root_dir = require("lspconfig.util").root_pattern(
                        "package.json",
                        "pnpm-lock.yaml",
                        "yarn.lock",
                        ".git"
                    ),
                },

                ts_ls = { -- ← this is the important addition
                    filetypes = {
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "vue",
                    },
                    init_options = {
                        plugins = {
                            {
                                name = "@vue/typescript-plugin",
                                location = vim.fn.stdpath("data")
                                    .. "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
                                languages = { "vue" },
                            },
                        },
                    },
                    root_dir = require("lspconfig.util").root_pattern("package.json", ".git"),
                },

                tailwindcss = {
                    filetypes = {
                        "css",
                        "scss",
                        "sass",
                        "html",
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "vue",
                    },
                    settings = {
                        tailwindCSS = {
                            includeLanguages = {
                                vue = "html",
                            },
                            validate = true,
                        },
                    },
                },

                cssls = {},
                html = {},
                lua_ls = {
                    single_file_support = true,
                    settings = {
                        Lua = {
                            workspace = { checkThirdParty = false },
                            completion = { workspaceWord = true, callSnippet = "Both" },
                            hint = {
                                enable = true,
                                setType = false,
                                paramType = true,
                                paramName = "Disable",
                                semicolon = "Disable",
                                arrayIndex = "Disable",
                            },
                            diagnostics = {
                                disable = { "incomplete-signature-doc", "trailing-space" },
                            },
                            format = {
                                enable = false,
                            },
                        },
                    },
                },
            },
            setup = {
                ["ruff"] = function()
                    Snacks.util.lsp.on({ name = "ruff" }, function(_, client)
                        -- Disable hover in favor of Pyright
                        client.server_capabilities.hoverProvider = false
                    end)
                end,
            },
        },
    },

    {
        "nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji" },
        opts = function(_, opts)
            table.insert(opts.sources, { name = "emoji" })
        end,
    },

    {
        "NvChad/nvim-colorizer.lua",
        opts = {
            user_default_options = {
                tailwind = true, -- corrected key name (tailwindcss → tailwind)
            },
        },
    },
}
