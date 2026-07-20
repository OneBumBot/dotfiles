return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '*',
    -- build = 'cargo build --release',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'default',
            ['<c-j>'] = { 'select_next', 'fallback' },
            ['<c-k>'] = { 'select_prev', 'fallback' },
        },

        appearance = { nerd_font_variant = 'normal' },

        -- signature = { enabled = true },

        completion = {
            menu = {
                border = 'none',
                winblend = vim.o.pumblend,
            },
            -- documentation = { auto_show = true, auto_show_delay_ms = 500 },
            -- ghost_text = { enabled = true },
        },

        cmdline = {
            keymap = {
                -- preset = 'inherit',
                ['<c-j>'] = { 'select_next', 'fallback' },
                ['<c-k>'] = { 'select_prev', 'fallback' },
            },
            -- completion = { menu = { auto_show = true } },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
}

