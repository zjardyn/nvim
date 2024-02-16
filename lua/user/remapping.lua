local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Package Keymappings
keymap("n", "<leader>e", vim.cmd.NvimTreeToggle)

-- Fterm 
keymap('n', '<M-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<M-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

vim.keymap.set('n', '<leader>c', function()
    local buf = vim.api.nvim_buf_get_name(0)
    -- Compile the C file to a.out and run it
    local compile_and_run_cmd = 'gcc ' .. buf .. ' && ./a.out'
    require('FTerm').scratch({ cmd = compile_and_run_cmd })
end)

-- vim.keymap.set('n', '<leader>r', '<CMD>lua require("FTerm").run("cargo check")<CR>')

-- remove search highlights
vim.keymap.set("n", "<CR>", ":noh<CR><CR>", {silent = true})

-- nvim-R 
vim.api.nvim_set_keymap('n', '<leader>rf', '<leader>R', { noremap = true, silent = true })

-- repeated indenting in visual mode
vim.keymap.set("v", ">", ">gv", {silent = true})
vim.keymap.set("v", "<", "<gv", {silent = true})

-- Buffer Manipulation 
vim.keymap.set("n", "gn", vim.cmd.bnext)
vim.keymap.set("n", "gp", vim.cmd.bprevious)
vim.keymap.set("n", "bd", vim.cmd.bdelete)


-- vim.keymap.set("x", "p", [["_dP]])
-- vim.keymap({"n", "x"}, "j", "gj", opts)
