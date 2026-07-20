return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
        '.git',
    },
    settings = {
        Lua = {
            hint = {
                enable = true,
                -- arrayIndex = 'Disable',
            },
            runtime = { version = 'LuaJIT' },
            semantic = { enable = false },
            workspace = {
                checkThirdParty = false,
                -- library = vim.api.nvim_get_runtime_file('', true),
                -- library = { '$VIMRUNTIME' },
            },
        },
    },
}
