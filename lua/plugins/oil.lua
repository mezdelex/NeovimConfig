return {
    "stevearc/oil.nvim",
    config = function()
        local oil = require("oil")

        oil.setup({
            view_options = { show_hidden = true },
        })

        vim.keymap.set("n", "<leader>o", oil.open)
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
}
