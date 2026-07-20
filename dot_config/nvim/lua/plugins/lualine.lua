return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            section_separators = { left = '', right = '' },
            component_separators = { left = '|', right = '|' },
            refresh = { statusline = 100 },
            theme = "gruvbox",
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = {
                -- 'branch',
                { 'b:gitsigns_head', icon = '' },
                {
                    'diff',
                    source = function()
                        local gitsigns = vim.b.gitsigns_status_dict
                        if gitsigns then
                            return {
                                added = gitsigns.added,
                                modified = gitsigns.changed,
                                removed = gitsigns.removed,
                            }
                        end
                    end,
                },
            },
            lualine_c = {
                { 'filename', path = 0 },
            },

            lualine_x = {
                {
                    'diagnostics',
                    -- symbols = {
                    --     error = ' ',
                    --     warn = ' ',
                    --     info = ' ',
                    --     hint = ' ',
                    -- },
                },
                'encoding',
                --'fileformat',
                {
                    'filetype',
                }
            },
            lualine_y = { 'progress' },
            lualine_z = { 'location' },
        },
    },
}
