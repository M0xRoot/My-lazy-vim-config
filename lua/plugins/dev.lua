return {
    {
        "barrettruth/live-server.nvim",
        build = "npm install -g live-server", -- optional: auto install
        cmd = { "LiveServerStart", "LiveServerStop" },
        config = true, -- or opts = {}
    },
    {
        "DaikyXendo/nvim-material-icon",
        lazy = false,
        priority = 1000,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
}
