-- Make sure external commands are found
vim.env.PATH = vim.env.PATH .. ":/usr/bin"

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    keys = {
        {
            "<leader>d",
            function()
                Snacks.dashboard()
            end,
            desc = "Snacks Dashboard",
        },
    },

    opts = {
        dashboard = {
            enabled = true,
            width = 60,
            pane_gap = 4,
            autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
            preset = {
                header = [[



"        .--.                   ",
"       |o_o |                  ",
"       |:_/ |                  ",
"      //   \\ \\                 ",
"     (|     | )                ",
"    /'\\_   _/`\\                ",
"    \\___)=(___/                ",
"  _____ _                 _    ",
" / ____| |               | |   ",
"| (___ | |__   ___   ___ | | __",
" \\___ \\| '_ \\ / _ \\ / _ \\| |/ /",
" ____) | | | | (_) | (_) |   < ",
"|_____/|_| |_|\\___/ \\___/|_|\\_\\",
                    ]],

                -- Key mappings section
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    {
                        icon = " ",
                        key = "g",
                        desc = "Find Text",
                        action = ":lua Snacks.dashboard.pick('live_grep')",
                    },
                    {
                        icon = " ",
                        key = "r",
                        desc = "Recent Files",
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                    },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    {
                        icon = "󰒲 ",
                        key = "L",
                        desc = "Lazy",
                        action = ":Lazy",
                        enabled = package.loaded.lazy ~= nil,
                    },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },

            formats = {
                icon = function(item)
                    if item.file and (item.icon == "file" or item.icon == "directory") then
                        return Snacks.dashboard.icon(item.file, item.icon)
                    end
                    return { item.icon, width = 2, hl = "icon" }
                end,
                footer = { "%s", align = "center" },
                header = { "%s", align = "center" },
                file = function(item, ctx)
                    local fname = vim.fn.fnamemodify(item.file, ":~")
                    fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
                    if #fname > ctx.width then
                        local dir = vim.fn.fnamemodify(fname, ":h")
                        local file = vim.fn.fnamemodify(fname, ":t")
                        if dir and file then
                            file = file:sub(-(ctx.width - #dir - 2))
                            fname = dir .. "/…" .. file
                        end
                    end
                    local dir, file = fname:match("^(.*)/(.+)$")
                    return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
                end,
            },
            sections = {
                { section = "header" },
                {
                    pane = 2,
                    section = "terminal",
                    cmd = "/usr/bin/colorscript -e square",
                    height = 5,
                    padding = 1,
                },

                { section = "keys", gap = 1, padding = 1 },

                {
                    pane = 2,
                    icon = " ",
                    desc = "Browse Repo",
                    padding = 1,
                    key = "b",
                    action = function()
                        Snacks.gitbrowse()
                    end,
                },
                function()
                    local has_gh = vim.fn.executable("gh") == 1
                    local in_git = Snacks.git.get_root() ~= nil

                    local buttons = {
                        {
                            type = "terminal",
                            title = "Open PRs",
                            cmd = [[gh pr list --limit 5 --state open --json number,title,author --jq '.[] | "#\(.number) \(.title) by \(.author.login)"']],
                            icon = "",
                            height = 7,
                            enabled = vim.fn.executable("gh") == 1 and Snacks.git.get_root() ~= nil,
                        },
                        {
                            type = "terminal",
                            title = "Last Commits",
                            cmd = "git log --oneline -n 5",
                            icon = " ",
                            height = 7,
                            enabled = in_git,
                        },
                        {
                            type = "terminal",
                            title = "Open Issues",
                            cmd = [[gh issue list --limit 5 --state open --json number,title,author --jq '.[] | "#\(.number) \(.title) by \(.author.login)"']],
                            icon = "",
                            height = 7,
                            enabled = vim.fn.executable("gh") == 1 and Snacks.git.get_root() ~= nil,
                        },
                        {
                            type = "terminal",
                            title = "Git Status",
                            cmd = "git --no-pager diff --stat -B -M -C",
                            icon = " ",
                            height = 10,
                            enabled = in_git,
                        },
                    }

                    return vim.tbl_map(function(btn)
                        return vim.tbl_extend("force", {
                            pane = 2,
                            section = btn.type == "terminal" and "terminal" or "keys",
                            padding = 1,
                            ttl = 300,
                            indent = 3,
                        }, btn)
                    end, buttons)
                end,

                { section = "startup" },
            },
        },
    },

    config = function(_, opts)
        require("snacks").setup(opts)
    end,
}
