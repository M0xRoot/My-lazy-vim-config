return {
	{
		"mason-org/mason.nvim",
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
				"intelephense",
				"gopls",
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
				"intelephense",
				"gopls",
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
						rulesCustomizations = {
							["no-unused-vars"] = "off",
							["@typescript-eslint/no-unused-vars"] = "off",
						},
					},
				},

				clangd = {
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
						offsetEncoding = { "utf-16" },
					},
				},

				vtsls = {
					filetypes = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"vue",
						"tsx",
						"jsx",
					},
					settings = {
						vtsls = {
							tsserver = {
								globalPlugins = {
									{
										name = "@vue/typescript-plugin",
										location = vim.fn.stdpath("data")
											.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
										languages = { "vue" },
										configNamespace = "typescript",
										enableForWorkspaceTypeScriptVersions = true,
									},
								},
							},
						},
					},
				},

				pyright = {
					filetypes = { "python" },
					capabilities = (function()
						local capabilities = vim.lsp.protocol.make_client_capabilities()
						capabilities.textDocument.publishDiagnostics = {
							tagSupport = { valueSet = { 2 } },
						}
						return capabilities
					end)(),
					settings = {
						python = {
							analysis = {
								useLibraryCodeForTypes = true,
								diagnosticSeverityOverrides = { reportUnusedVariable = "warning" },
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
						html = { options = { ["output.selfClosingStyle"] = "xhtml" } },
						includeLanguages = { vue = "html" },
						preferences = {
							["emmet.showExpandedAbbreviation"] = "always",
							["emmet.showSuggestionsAsSnippets"] = true,
						},
					},
				},

				tailwindcss = {
					enabled = false,
					filetypes = {
						"css",
						"scss",
						"html",
						"vue",
						"jsx",
						"tsx",
					},
					settings = {
						tailwindCSS = {
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
							format = { enable = false },
						},
					},
				},

				gopls = {
					settings = {
						gopls = {
							completion = true,
							completeUnimported = true,
							usePlaceholders = true,
							staticcheck = true,
							gofumpt = true,

							analyses = {
								unusedparams = true,
								unusedwrite = true,
								nilness = true,
								shadow = true,
								unusedvariables = true,
							},

							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
							},
						},
					},
				},
			},

			setup = {
				["ruff"] = function()
					Snacks.util.lsp.on({ name = "ruff" }, function(_, client)
						client.server_capabilities.hoverProvider = false
					end)
				end,
			},
		},
		init = function()
			-- Use native Neovim 0.11 LSP config to start vue_ls
			-- since lspconfig's servers table doesn't pick it up reliably
			vim.lsp.config("vue_ls", {
				cmd = { "vue-language-server", "--stdio" },
				filetypes = { "vue" },
				root_markers = { "package.json", "pnpm-lock.yaml", "yarn.lock", ".git" },
				init_options = {
					vue = { hybridMode = true },
				},
			})
			vim.lsp.enable("vue_ls")
		end,
	},

	{
		"nvim-cmp",
		dependencies = { "hrsh7th/cmp-emoji" },
		opts = function(_, opts)
			table.insert(opts.sources, { name = "emoji" })
		end,
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
}
