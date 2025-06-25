return {
    "OXY2DEV/markview.nvim",
    config = function()
        require("markview").setup({
            experimental = { check_rtp_message = false },
            preview = {
                filetypes = { "codecompanion", "markdown" },
                ignore_buftypes = {},
            },
        })

        vim.keymap.set("n", "<leader>m", "<cmd>Markview<cr>")
    end,
}
