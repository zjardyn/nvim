vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Package Keymappings
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)

-- Fterm 
vim.keymap.set('n', '<M-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<M-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- vim.keymap.set('n', '<leader>c', function()
--     local buf = vim.api.nvim_buf_get_name(0)
--     -- Compile the C file to a.out
--     local compile_cmd = 'gcc ' .. buf
--     -- Execute the compilation command
--     local compile_success = os.execute(compile_cmd)
--
--     -- If compilation is successful, run the compiled binary
--     if compile_success then
--         -- Execute the compiled binary
--         local run_cmd = './a.out'
--         require('FTerm').scratch({ cmd = run_cmd })
--     end
-- end)


vim.keymap.set('n', '<leader>c', function()
    local buf = vim.api.nvim_buf_get_name(0)
    -- Compile the C file to a.out
    local compile_cmd = 'gcc ' .. buf .. ' 2>&1'  -- Redirect stderr to stdout
    -- Execute the compilation command and capture the output
    local handle = io.popen(compile_cmd)
    local compile_output = handle:read('*a')
    handle:close()

    -- Check if the compilation was successful
    if compile_output == '' then
        -- Compilation was successful, run the compiled binary
        local run_cmd = './a.out'
        require('FTerm').scratch({ cmd = run_cmd })
    else
        -- Compilation failed, display the error message in FTerm
        require('FTerm').scratch({ cmd = 'echo "Compilation failed:\n' .. compile_output .. '\n"; read -n 1 -s -r -p "Press any key to continue"' })
    end
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



