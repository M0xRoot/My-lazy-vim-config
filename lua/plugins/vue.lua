return {
    {
        "neovim/nvim-lspconfig",
        init = function()
            vim.lsp.config("vue_ls", {
                filetypes = { "vue" },
                init_options = {
                    vue = { hybridMode = true },
                },
            })
            vim.lsp.enable("vue_ls")
        end,
    },
}
