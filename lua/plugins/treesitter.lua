return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        local opts = { remap = true }

        require("nvim-treesitter.configs").setup({
            auto_install = true,
            highlight = { enable = true },
        })
        require("ts_context_commentstring").setup({ enable_autocmd = false })
        vim.filetype.get_option = function(filetype, option)
            return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
                or vim.bo.commentstring
                or vim.filetype.get_option(filetype, option)
        end

        vim.keymap.set("n", "<a-/>", "gcc", opts)
        vim.keymap.set("v", "<a-/>", "gc", opts)
    end,
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
}
