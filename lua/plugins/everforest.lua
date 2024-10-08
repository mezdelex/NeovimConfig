return {
    "sainnhe/everforest",
    config = function()
        vim.g.everforest_disable_italic_comment = true
        vim.g.everforest_enable_italic = false

        vim.cmd.colorscheme("everforest")
    end,
}
