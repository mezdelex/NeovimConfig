---@type Utils.Pack.Spec
return {
    src = "https://github.com/windwp/nvim-ts-autotag",
    config = function()
        require("nvim-ts-autotag").setup()
    end,
}
