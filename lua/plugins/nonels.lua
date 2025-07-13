return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null = require("null-ls")

        null.setup({
            sources = {
                null.builtins.formatting.csharpier,
                null.builtins.formatting.prettier,
                null.builtins.formatting.shfmt,
                null.builtins.formatting.sql_formatter,
                null.builtins.formatting.stylua,
            },
        })
    end,
}
