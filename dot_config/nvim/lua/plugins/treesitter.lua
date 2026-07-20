return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        local parsers = {
            'c',
            'lua',
            'markdown',
            'query',
            'vim',
            'vimdoc',
            'go',
            'python',
            'rust',
            'cpp',
            'typescript',
            'javascript',
            'html',
            'css',
            'toml',
            'yaml',
            'json',
            'ini',
            'bash',
            'latex',
            -- 'typst',
        }

        if vim.fn.executable('tree-sitter') == 1 then
            require('nvim-treesitter').install(parsers)
        end

        vim.api.nvim_create_autocmd('FileType', {
            -- stylua: ignore
            callback = function(args)
                local ft = args.match
                local exclude_fts = { checkhealth = true }
                if exclude_fts[ft] then return end

                local lang = vim.treesitter.language.get_lang(ft) or ft
                if not vim.treesitter.language.add(lang) then return end

                -- highlight
                vim.treesitter.start()

                -- indent
                -- vim.bo.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'

                -- folds
                -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                -- vim.wo.foldmethod = 'expr'
            end,
        })
    end,
}
