require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

-- Example keybindings
vim.keymap.set('n', '<M-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<M-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

vim.keymap.set('n', '<leader>c', '<CMD>lua require("FTerm").run("cargo run")<CR>')
vim.keymap.set('n', '<leader>r', '<CMD>lua require("FTerm").run("cargo check")<CR>')

-- require('FTerm').open()
-- or create a vim command
vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })
-- require('FTerm').close()
-- or create a vim command
vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })
-- require('FTerm').exit()
-- or create a vim command
vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })
-- require('FTerm').toggle()
-- or create a vim command
vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })

vim.api.nvim_create_user_command('CargoBuild', function()
    require('FTerm').scratch({ cmd = {'cargo', 'build', '--target', os.getenv("RUST_TARGET")} })
end, { bang = true })

vim.keymap.set('n', '<leader>z', 'CargoBuild')

