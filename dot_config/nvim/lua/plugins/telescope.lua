return {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-ui-select.nvim',
    },
    opts = {
        defaults = {
            prompt_prefix = '  ',
            selection_caret = '  ',
            -- dynamic_preview_title = true,
            -- path_display = { 'filename_first' },

            sorting_strategy = 'ascending',
            layout_strategy = 'horizontal',
            layout_config = {
                horizontal = {
                    prompt_position = 'top',
                    preview_width = 0.5,
                },
            },
            mappings = {
                i = {
                    ['<c-j>'] = 'move_selection_next',
                    ['<c-k>'] = 'move_selection_previous',
                    ['<esc>'] = 'close',
                },
                n = { ['<c-c>'] = 'close' },
            },
        },
        pickers = {
            buffers = { sort_mru = true },
        },
    },
    config = function(_, opts)
        local previewers = require('telescope.previewers')
        local old_cat = previewers.vim_buffer_cat.new
        previewers.vim_buffer_cat.new = function(op)
            op = op or {}
            op.preview_title = 'Preview'
            return old_cat(op)
        end
        local old_vimgrep = previewers.vim_buffer_vimgrep.new
        previewers.vim_buffer_vimgrep.new = function(op)
            op = op or {}
            op.preview_title = 'Preview'
            return old_vimgrep(op)
        end

        local themes = require('telescope.themes')
        opts.extensions = {
            ['ui-select'] = {
                themes.get_dropdown({}),
            },
            smart_open = {
                match_algorithm = 'fzf',
                result_limit = 30,
                mappings = {
                    i = {
                        ['<C-w>'] = { '<c-s-w>', type = 'command' },
                    },
                },
            },
        }

        local telescope = require('telescope')
        telescope.setup(opts)
        telescope.load_extension('fzf')
        telescope.load_extension('ui-select')

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Telescope oldfiles' })
        vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Telescope resume last search' })
    end,
}
