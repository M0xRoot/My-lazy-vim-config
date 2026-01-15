-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Laravel quick actions
vim.keymap.set("n", "<leader>la", ":Laravel artisan ", { desc = "Artisan command" })
vim.keymap.set("n", "<leader>lc", ":Laravel make:controller ", { desc = "Make Controller" })
vim.keymap.set("n", "<leader>lm", ":Laravel make:model ", { desc = "Make Model" })
vim.keymap.set("n", "<leader>lmf", ":Laravel make:factory ", { desc = "Make Factory" })
vim.keymap.set("n", "<leader>lmm", ":Laravel make:migration ", { desc = "Make Migration" })
vim.keymap.set("n", "<leader>lmt", ":Laravel make:test ", { desc = "Make Test" })
