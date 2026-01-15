-- In lua/plugins/dev.lua or similar
return {
    {
        "barrettruth/live-server.nvim",
        build = "npm install -g live-server", -- optional: auto install
        cmd = { "LiveServerStart", "LiveServerStop" },
        config = true, -- or opts = {}
    },
}
