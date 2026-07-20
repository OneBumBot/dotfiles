return {
    'mbbill/undotree',
    keys = {
        { '<leader>u', mode = 'n', vim.cmd.UndotreeToggle },
    },
    config = function()
        vim.g.undotree_WindowLayout = 3
        vim.g.undotree_ShortIndicators = 1
        vim.g.undotree_SetFocusWhenToggle = 1
        -- vim.g.undotree_DiffAutoOpen = 0
        vim.g.undotree_HelpLine = 0
    end,
}
