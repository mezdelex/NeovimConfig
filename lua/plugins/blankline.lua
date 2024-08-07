return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup({
            scope = {
                show_end = false,
                show_start = false,
            },
        })
    end,
}
