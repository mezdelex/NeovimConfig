return {
    "nvim-telescope/telescope.nvim",
    config = function()
        local builtin = require("telescope.builtin")
        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                layout_config = {
                    height = vim.o.lines,
                    width = vim.o.columns,
                },
                layout_strategy = "vertical",
                path_display = { "truncate" },
            },
            extensions = {
                live_grep_args = { auto_quoting = false },
            },
        })
        telescope.load_extension("fzf")
        telescope.load_extension("live_grep_args")

        vim.keymap.set("n", "<leader>F", telescope.extensions.live_grep_args.live_grep_args)
        vim.keymap.set("n", "<leader>d", builtin.diagnostics)
        vim.keymap.set("n", "<leader>f", builtin.fd)
        vim.keymap.set("n", "<leader>j", builtin.jumplist)
        vim.keymap.set("n", "<leader>q", builtin.quickfix)
        vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols)
        vim.keymap.set({ "n", "x" }, "gs", builtin.grep_string)
    end,
    dependencies = {
        "nvim-telescope/telescope-live-grep-args.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
}
