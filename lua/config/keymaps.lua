-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Laravel quick actions
-- General
vim.keymap.set("n", "<leader>la", ":!php artisan ", { desc = "Artisan command" })

-- Make commands
vim.keymap.set("n", "<leader>lmc", ":terminal php artisan make:controller ", { desc = "Controller" })
vim.keymap.set("n", "<leader>lmm", ":terminal php artisan make:model ", { desc = "Model" })
vim.keymap.set("n", "<leader>lf", ":terminal php artisan make:factory ", { desc = "Factory" })
vim.keymap.set("n", "<leader>lmM", ":terminal php artisan make:migration ", { desc = "Migration" })
vim.keymap.set("n", "<leader>lms", ":terminal php artisan make:seeder ", { desc = "Seeder" })
vim.keymap.set("n", "<leader>lmr", ":terminal php artisan make:resource ", { desc = "Resource" })
vim.keymap.set("n", "<leader>lp", ":terminal php artisan make:policy ", { desc = "Policy" })
vim.keymap.set("n", "<leader>le", ":terminal php artisan make:event ", { desc = "Event" })
vim.keymap.set("n", "<leader>lj", ":terminal php artisan make:job ", { desc = "Job" })
vim.keymap.set("n", "<leader>lmd", ":terminal php artisan make:middleware ", { desc = "Middleware" })
vim.keymap.set("n", "<leader>lx", ":terminal php artisan make:exception ", { desc = "Exception" })
vim.keymap.set("n", "<leader>lma", ":terminal php artisan make:mail ", { desc = "Mail" })
vim.keymap.set("n", "<leader>lC", ":terminal php artisan make:command ", { desc = "Command" })
vim.keymap.set("n", "<leader>lt", ":terminal php artisan make:test ", { desc = "Test" })
vim.keymap.set("n", "<leader>lo", ":terminal php artisan optimize:clear<CR>", { desc = "Optimize" })
vim.keymap.set("n", "<leader>lmS", ":terminal php artisan db:seed ", { desc = "Seed" })
vim.keymap.set("n", "<leader>lM", ":terminal php artisan migrate ", { desc = "Migrate" })

-- Useful commands
vim.keymap.set("n", "<leader>lr", ":terminal php artisan route:list<CR>", { desc = "Route List" })

-- select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select All" })

vim.keymap.set("n", "U", "<cmd>redo<CR>", { desc = "Redo" })

vim.api.nvim_create_user_command("CopilotToggle", function()
    vim.g.copilot_enabled = not vim.g.copilot_enabled

    if vim.g.copilot_enabled then
        print("Copilot Suggestions: ON")
    else
        print("Copilot Suggestions: OFF")
    end
end, {})
