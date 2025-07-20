return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        local fallback = vim.filetype.get_option
        local options = { remap = true }

        require("nvim-treesitter.configs").setup({
            auto_install = true,
            highlight = { enable = true },
        })
        require("ts_context_commentstring").setup({
            enable_autocmd = false,
        })

        vim.filetype.get_option = function(filetype, option)
            return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
                or fallback(filetype, option)
        end

        vim.keymap.set("n", "<a-/>", "gcc", options)
        vim.keymap.set("v", "<a-/>", "gc", options)
    end,
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
}
