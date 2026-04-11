return {
    {
        "nvimdev/dashboard-nvim",
        enabled = false,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },

        opts = {
            options = {
                theme = "auto",
                globalstatus = true,
                always_divide_middle = true,

                section_separators = { left = "", right = "" },
                component_separators = { left = "", right = "" },
            },

            sections = {
                lualine_a = {
                    { "mode", icon = "" },
                },

                lualine_b = {
                    { "branch", icon = "" },
                    "diff",
                },

                lualine_c = {
                    {
                        "filename",
                        path = 1,
                        symbols = {
                            modified = " ●",
                            readonly = " ",
                            unnamed = "[No Name]",
                        },
                    },
                },

                lualine_x = {
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },

                        symbols = {
                            error = " ",
                            warn = " ",
                            info = " ",
                            hint = " ",
                        },

                        colored = true,
                        update_in_insert = false,
                        always_visible = true,
                    },

                    "lsp_status",
                    "encoding",
                    "filetype",
                },

                lualine_y = {
                    { "progress", icon = "" },
                },

                lualine_z = {
                    { "location", icon = "" },
                },
            },
        },
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
        end,
    },
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        opts = {
            easing = "quadratic",
            hide_cursor = true,
            stop_eof = true,
            respect_scrolloff = true,
        },
        config = function(_, opts)
            require("neoscroll").setup(opts)

            local map = vim.keymap.set

            local scroll_opts = { silent = true, noremap = true }

            map("n", "<C-u>", function()
                require("neoscroll").scroll(-vim.wo.scroll, true, 200)
            end, scroll_opts)
            map("n", "<C-d>", function()
                require("neoscroll").scroll(vim.wo.scroll, true, 200)
            end, scroll_opts)

            map("n", "<C-b>", function()
                require("neoscroll").scroll(-vim.api.nvim_win_get_height(0), true, 300)
            end, scroll_opts)
            map("n", "<C-f>", function()
                require("neoscroll").scroll(vim.api.nvim_win_get_height(0), true, 300)
            end, scroll_opts)
        end,
    },
    {
        "folke/noice.nvim",
        opts = function(_, opts)
            -- ensure tables exist
            opts.routes = opts.routes or {}
            opts.presets = opts.presets or {}

            table.insert(opts.routes, {
                filter = {
                    event = "notify",
                    find = "No information available",
                },
                opts = { skip = true },
            })

            table.insert(opts.routes, {
                filter = {
                    event = "msg_show",
                    find = "written",
                },
                opts = { skip = true },
            })

            local function is_focused()
                return vim.g.neovim_focused ~= false
            end

            vim.api.nvim_create_autocmd("FocusGained", {
                callback = function()
                    vim.g.neovim_focused = true
                end,
            })

            vim.api.nvim_create_autocmd("FocusLost", {
                callback = function()
                    vim.g.neovim_focused = false
                end,
            })

            table.insert(opts.routes, 1, {
                filter = {
                    cond = function()
                        return not is_focused()
                    end,
                },
                view = "notify_send",
                opts = { stop = false },
            })

            opts.commands = {
                all = {
                    view = "split",
                    opts = {
                        enter = true,
                        format = "details",
                        position = "bottom",
                    },
                    filter = {},
                },
            }

            opts.presets.lsp_doc_border = true
            opts.presets.long_message_to_split = true
            opts.presets.inc_rename = true
            opts.presets.command_palette = true
        end,
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            timeout = 3000,
            max_width = 60,
            stages = "fade_in_slide_out",

            render = "compact",

            background_colour = "#000000",
            fps = 60,
        },
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },

        opts = {
            attach_navic = true,

            show_dirname = true,
            show_basename = true,

            separator = "  ",

            exclude_filetypes = {
                "TelescopePrompt",
                "lazy",
                "mason",
                "help",
                "NvimTree",
                "alpha",
            },
        },
    },
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        dependencies = "nvim-tree/nvim-web-devicons",

        keys = {
            { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
            { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
            { "<leader>bd", "<Cmd>bdelete<CR>", desc = "Delete buffer" },
        },

        opts = {
            options = {
                mode = "buffers",
                separator_style = "slant",

                show_buffer_close_icons = false,
                show_close_icon = false,

                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(_, _, diagnostics_dict)
                    local s = ""
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " " or (e == "warning" and " " or " ")
                        s = s .. sym .. n .. " "
                    end
                    return s
                end,

                indicator = {
                    style = "underline",
                },

                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "Explorer",
                        highlight = "Directory",
                        separator = true,
                    },
                },

                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = { "close" },
                },

                always_show_bufferline = true,
                auto_toggle_bufferline = false,
            },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",

        opts = {
            indent = {
                char = "│",
                highlight = { "IblIndent" },
            },

            scope = {
                enabled = true,
                show_start = false,
                show_end = false,
            },

            exclude = {
                filetypes = {
                    "help",
                    "lazy",
                    "mason",
                    "NvimTree",
                    "TelescopePrompt",
                },
            },
        },
    },
    -- filename
    {
        "b0o/incline.nvim",
        event = "BufReadPre",
        priority = 1200,

        config = function()
            local devicons = require("nvim-web-devicons")

            require("incline").setup({
                window = {
                    padding = 0,
                    margin = { horizontal = 1 },
                    placement = {
                        vertical = "top",
                        horizontal = "right",
                    },
                },

                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

                    if filename == "" then
                        filename = "[No Name]"
                    end

                    local icon, _ = devicons.get_icon(filename)

                    local modified = vim.bo[props.buf].modified

                    return {
                        " ",

                        icon and (icon .. " ") or "",

                        {
                            filename,
                            gui = "bold",
                            guifg = "#DCD7BA", -- soft neutral (Kanagawa-like calm)
                        },

                        modified and {
                            " ●",
                            guifg = "#C34043", -- subtle red dot
                        } or "",

                        " ",
                        guibg = "NONE",
                    }
                end,
            })
        end,
    },
    -- LazyGit integration with Telescope
    {
        "kdheepak/lazygit.nvim",
        keys = {
            {
                ";c",
                ":LazyGit<Return>",
                silent = true,
                noremap = true,
            },
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = {
            { "tpope/vim-dadbod", lazy = true },
            { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
        },
        cmd = {
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
        keys = {
            {

                "<leader>d",
                "<cmd>NvimTreeClose<cr><cmd>tabnew<cr><bar><bar><cmd>DBUI<cr>",
            },
        },
    },
}
