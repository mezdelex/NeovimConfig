return {
    config = function()
        local codecompanion = require("codecompanion")

        codecompanion.setup({
            interactions = {
                chat = {
                    adapter = {
                        model = "gemini-2.5-flash",
                        name = "gemini",
                    },
                },
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
