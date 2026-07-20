vim.lsp.enable({
    --'rust-analyzer',
    'lua_ls',
    'gopls',
    'ruff',
    'ty',
})

vim.diagnostic.config({
    severity_sort = true,
    float = {
        source = true,
        header = '',
        prefix = '',
    },
    signs = false,
    -- signs = {
    --     text = {
    --         [vim.diagnostic.severity.ERROR] = ' ',
    --         [vim.diagnostic.severity.WARN] = ' ',
    --         [vim.diagnostic.severity.INFO] = ' ',
    --         [vim.diagnostic.severity.HINT] = ' ',
    --     },
    -- },
    virtual_text = true,
    -- virtual_lines = { current_line = true },
})

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'show a floating diagnostic window' })

-- enable inlay hints by default
-- vim.lsp.inlay_hint.enable(true)

vim.keymap.set('n', '<leader>h', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'toggle inlay hints' })

-- ( K, [d, ]d, grr, gri, gra, grn, grt ) are built-in
local has_telescope, builtin = pcall(require, 'telescope.builtin')
if has_telescope then
    vim.keymap.set('n', 'grr', builtin.lsp_references, { desc = 'goto references' })
    vim.keymap.set('n', 'gri', builtin.lsp_implementations, { desc = 'goto implementation' })
    vim.keymap.set('n', 'grt', builtin.lsp_type_definitions, { desc = 'goto type definition' })

    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'goto definition' })
    vim.keymap.set('n', 'gq', builtin.diagnostics, { desc = 'diagnostics list' })
else
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'goto definition' })
    vim.keymap.set('n', 'gq', vim.diagnostic.setqflist, { desc = 'diagnostics list' })
end

