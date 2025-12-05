return {
    config = function()
        local codecompanion = require("codecompanion")

        codecompanion.setup({
            ignore_warnings = true,
            strategies = {
                chat = { adapter = "gemini" },
            },
        })

        vim.keymap.set("n", "<leader>h", codecompanion.chat)
    end,
    defer = true,
    dependencies = {
        {
            defer = true,
            src = "https://github.com/nvim-lua/plenary.nvim",
        },
    },
    src = "https://github.com/olimorris/codecompanion.nvim",
}
