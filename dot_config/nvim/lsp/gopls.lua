return {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod' },
    root_markers = { 'go.mod', 'go.work', '.git' },
    settings = {
        gopls = {
            gofumpt = true, -- prefer conform.nvim, but keeping this as a fallback anyway
            completeFunctionCalls = false, -- fix weird completion behavior
            -- semanticTokens = true, -- way slower than treesitter
            -- staticcheck = true, -- a lot of checks
            analyses = {
                appendclipped = true,
                shadow = true,
                slicesdelete = true,
            },
            hints = {
                assignVariableTypes = true,
                -- compositeLiteralFields = true,
                -- compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                ignoredError = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            -- codelenses = {
            -- 	-- gc_details = false,
            -- 	-- generate = true,
            -- 	-- regenerate_cgo = true,
            -- 	-- run_govulncheck = true,
            -- 	-- test = true,
            -- 	-- tidy = true,
            -- 	-- upgrade_dependency = true,
            -- 	-- vendor = true,
            -- },
        },
    },
}
