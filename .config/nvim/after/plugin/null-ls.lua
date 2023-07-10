local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
    },
})

local js_source = {
    name = "js_source",
    filetypes = {
        ["javascript"] = true,
        ["javascriptreact"] = true,
        ["typescript"] = true,
        ["typescriptreact"] = true
    },
    methods = { [require("null-ls").methods.FORMATTING] = true },
    generator = {
        -- fn = function()
        --     return "I am a source!"
        -- end,
    },
    id = 1,
}

null_ls.register(js_source)
