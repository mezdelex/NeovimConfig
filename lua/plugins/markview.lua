return {
    "OXY2DEV/markview.nvim",
    config = function()
        require("markview").setup()

        vim.keymap.set("n", "<leader>m", "<cmd>Markview<cr>")
    end,
}
