return {
    "OXY2DEV/markview.nvim",
    config = function()
        local opts = { silent = true }

        require("markview").setup()

        vim.keymap.set("n", "<leader>m", ":Markview<cr>", opts)
    end,
}
