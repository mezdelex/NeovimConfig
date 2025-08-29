---@type Utils.Pack.Spec
return {
    src = "https://github.com/olimorris/codecompanion.nvim",
    config = function()
        local codecompanion = require("codecompanion")

        codecompanion.setup({
            strategies = {
                chat = { adapter = "gemini" },
            },
        })

        vim.keymap.set("n", "<leader>h", codecompanion.chat)
    end,
    dependencies = {
        { src = "https://github.com/nvim-lua/plenary.nvim" },
    },
}

