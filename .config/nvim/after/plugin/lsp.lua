local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer',
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- lsp.format_on_save({
--     format_opts = {
--         async = false,
--         timeout_ms = 10000,
--     },
--     servers = {
--         ['lua_ls'] = { 'lua' },
--         ['rust_analyzer'] = { 'rust' },
--         -- ['tsserver'] = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
--         -- if you have a working setup with null-ls
--         -- you can specify filetypes it can format.
--         ['null-ls'] = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
--     }
-- })

-- lsp.on_attach(function(client, bufnr)
--     lsp.default_keymaps({ buffer = bufnr })
--     lsp.buffer_autoformat()
-- end)

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    lsp.default_keymaps({ buffer = bufnr })
    lsp.buffer_autoformat()

    vim.keymap.set({ 'n', 'x' }, '<M-F>', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
    end, opts)

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<M-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

local cmp = require('cmp')

-- local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    }
})

-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<M-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<M-n>'] = cmp.mapping.select_next_item(cmp_select),
--   -- ['<M-y>'] = cmp.mapping.confirm({ select = true }),
--   ['<CR>'] = cmp.mapping.confirm({select = false}),
--   ["<C-S>"] = cmp.mapping.complete(),
-- })

local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
