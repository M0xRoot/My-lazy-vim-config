vim.g.mapleader = " "
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true -- relative line numbers for easier jumping
vim.opt.numberwidth = 4 -- thinner number column

-- title
vim.opt.title = true

-- indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.list = false
-- vim.opt.smarttab = true
-- vim.opt.breakindent = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true -- case sensitive when uppercase used
vim.opt.inccommand = "split"

-- ui
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8 -- horizontal scroll padding
vim.opt.signcolumn = "yes" -- always show sign column to avoid layout shift
vim.opt.cursorline = true -- highlight current line
vim.opt.termguicolors = true -- true color support
vim.opt.pumheight = 10 -- max items in completion popup
vim.opt.showmode = false -- hide -- INSERT -- (lualine shows it)
vim.opt.conceallevel = 2 -- hide markdown syntax characters

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"

-- files
vim.opt.swapfile = false -- no swap files
vim.opt.undofile = true -- persistent undo history
vim.opt.undolevels = 10000 -- more undo steps

-- performance
vim.opt.updatetime = 200 -- faster CursorHold events
vim.opt.timeoutlen = 300 -- faster which-key popup

-- editing
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.mouse = ""
vim.opt.formatoptions:append({ "r" })
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.virtualedit = "block" -- allow cursor past end of line in visual block

vim.opt.spell = false
