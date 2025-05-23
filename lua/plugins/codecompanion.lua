return {
    "olimorris/codecompanion.nvim",
    config = function()
        require("codecompanion").setup({
            strategies = {
                chat = { adapter = "gemini" },
            },
        })

        vim.keymap.set("n", "<leader>h", "<cmd>CodeCompanionChat<cr>")
    end,
}
