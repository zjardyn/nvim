-- require'lspconfig'.r_language_server.setup{}

-- local on_attach = function(client, bufnr)
--   -- Disable hover in favor of Pyright
--   client.server_capabilities.hoverProvider = false
-- end
--
-- require('lspconfig').r_language_server.setup {
--   on_attach = on_attach,
-- }

-- Define a function to disable diagnostics for R files
-- local function disable_diagnostics_for_r()
--     vim.lsp.diagnostic.clear(0)  -- Clear existing diagnostics
--     vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
-- end

-- Configure LSP for specific file types
-- nvim_lsp = require('lspconfig')
-- nvim_lsp.r_language_server.setup({
--     on_attach = function(client)
--         -- Disable diagnostics for R files
--         if vim.bo.filetype == "r" then
--             disable_diagnostics_for_r()
--         end
--     end,
-- })

-- Add autocmd to dynamically update LSP configuration when changing filetypes
-- vim.api.nvim_exec([[
--     augroup lsp_filetype
--         autocmd!
--         autocmd FileType r lua disable_diagnostics_for_r()
--     augroup END
-- ]], false)



-- Define a function to disable LSP warnings for R files
local function disable_lsp_warnings_for_r(client, bufnr)
    local config = {
        underline = false,
        virtual_text = false,
        signs = false,
        update_in_insert = false,
    }
    vim.lsp.diagnostic.save(bufnr, client.id, {}, config)
    vim.lsp.diagnostic.display({}, bufnr, client.id, config)
end

-- Configure LSP for R language server
require('lspconfig').r_language_server.setup({
    capabilities = {
        textDocument = {
            publishDiagnostics = {
                -- Disable diagnostics for R files
                enabled = false,
            },
        },
    },
    on_init = function(client)
        -- Disable LSP warnings for R files
        if string.lower(vim.bo.filetype) == "r" then
        -- if vim.bo.filetype == "r" then
            disable_lsp_warnings_for_r(client, vim.fn.bufnr())
        end
    end,
})


