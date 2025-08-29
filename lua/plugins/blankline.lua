---@type Utils.Pack.Spec
return {
    src = "https://github.com/lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup({
            scope = {
                show_end = false,
                show_start = false,
            },
        })
    end,
}
