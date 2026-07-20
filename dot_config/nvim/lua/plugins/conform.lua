return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'ruff_format', 'ruff_organize_imports' }, -- also 'ruff_fix' can be used here
            go = { 'gofumpt', 'goimports' }, -- i thought about adding golangci-lint (fmt) in here, but not sure yet
            rust = { 'rustfmt' },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
}
