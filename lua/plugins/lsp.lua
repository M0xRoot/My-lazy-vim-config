return {
    {
        "mason-org/mason.nvim", -- note: corrected the repo name (mason-org → williamboman)
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "eslint-lsp",
                "clangd",
                "codelldb",
                "clang-format",
                "pyright",
                "debugpy",
                "emmet-language-server",
                "luacheck",
                "shellcheck",
                "shfmt",
                "tailwindcss-language-server",
                "typescript-language-server",
                "vue-language-server",
                "css-lsp",
            })
        end,
    },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "eslint",
                "clangd",
                "pyright",
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
                eslint = {
                    filetypes = {
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "vue",
                        "jsx",
                        "tsx",
                    },
                    settings = {
                        workingDirectory = { mode = "auto" },
                    },
                },
                clangd = {
                    -- cmd = { "clangd", "--background-index", "--clang-tidy" },  -- add flags as needed
                    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders",
                        "--fallback-style=llvm",
                    },
                    init_options = {
                        usePlaceholders = true,
                        completeUnimported = true,
                        clangdFileStatus = true,
                    },
                    capabilities = {
                        offsetEncoding = { "utf-16" }, -- important for clangd
                    },
                },
                tsserver = {
                    on_attach = on_attach,
                    filetypes = {
                        "typescriptreact",
                        "typescript",
                        "javascriptreact",
                        "javascript",
                    },
                    cmd = {
                        "typescript-language-server",
                        "--stdio",
                    },
                },
                pyright = {
                    filetypes = { "python" },

                    capabilities = (function()
                        local capabilities = vim.lsp.protocol.make_client_capabilities()
                        capabilities.textDocument.publishDiagnostics = {
                            tagSupport = {
                                valueSet = { 2 },
                            },
                        }
                        return capabilities
                    end)(),

                    settings = {
                        python = {
                            analysis = {
                                useLibraryCodeForTypes = true,

                                diagnosticSeverityOverrides = {
                                    reportUnusedVariable = "warning",
                                },

                                typeCheckingMode = "off",
                                diagnosticMode = "off",
                            },
                        },
                    },
                },
                emmet_language_server = {
                    filetypes = {
                        "vue",
                        "css",
                        "html",
                        "scss",
                        "javascript",
                        "tsx",
                        "jsx",
                        "javascriptreact",
                        "typescriptreact",
                    },
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
                        "tsx",
                        "jsx",
                    },
                    handlers = {
                        ["textDocument/publishDiagnostics"] = function() end,
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
                        "jsx",
                        "tsx",
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
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.after.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.after.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        filetypes = { "python" },
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            local path = "~/.local/share/nvim-lazy/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
        end,
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                c = { "clang_format" },
                cpp = { "clang_format" },
            },
            formatters = {
                clang_format = {
                    command = "clang-format",
                    args = { "--style=file" }, -- or "-style=LLVM", or use .clang-format file in project
                },
            },
        },
    },
}
