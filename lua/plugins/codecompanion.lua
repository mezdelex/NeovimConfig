return {
    "olimorris/codecompanion.nvim",
    config = function()
        vim.g.copilot_enabled = false

        require("codecompanion").setup({
            strategies = {
                adapters = { chat = "copilot" },
            },
        })

        vim.keymap.set("n", "<leader>h", "<cmd>CodeCompanionChat<cr>")
    end,
    dependencies = { "github/copilot.vim" },
}
