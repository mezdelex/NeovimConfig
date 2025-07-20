return {
    "mistweaverco/kulala.nvim",
    config = function()
        require("kulala").setup({
            global_keymaps = true,
            global_keymaps_prefix = "<leader>k",
        })
    end,
}
