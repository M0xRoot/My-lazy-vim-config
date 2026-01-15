-- Better looking built-in terminal floating window
vim.o.termguicolors = true
local state = { floating = { buf = -1, win = -1 } }

local function create_floating_window()
    local width = math.floor(vim.o.columns * 0.85)
    local height = math.floor(vim.o.lines * 0.75)
    local col = math.floor((vim.o.columns - width) / 2)
    local row = math.floor((vim.o.lines - height) / 2)

    local buf = state.floating.buf
    if not vim.api.nvim_buf_is_valid(buf) then
        buf = vim.api.nvim_create_buf(false, true)
        state.floating.buf = buf
    end

    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal",
        border = "rounded",
        winblend = 15, -- ← slight transparency
    })

    -- Very important for modern feeling
    vim.wo[win].winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder"
    vim.cmd(string.format("buffer %d", buf))
    vim.cmd("terminal")
    vim.cmd("startinsert!")
    -- vim.bo[buf].buftype = "terminal"
    -- vim.bo[buf].filetype = "terminal"

    state.floating.win = win

    if vim.bo[buf].buftype ~= "terminal" then
        vim.cmd("terminal")
        vim.cmd("startinsert!")
    end

    return win
end

local function toggle_floating_terminal()
    if vim.api.nvim_win_is_valid(state.floating.win) then
        vim.api.nvim_win_hide(state.floating.win)
    else
        create_floating_window()
    end
end

vim.keymap.set({ "n", "t" }, "<F4>", toggle_floating_terminal, { desc = "Toggle nice floating terminal" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
