---@type Utils.Pack.Spec
return {
    src = "https://github.com/kevinhwang91/nvim-bqf",
    config = function()
        require("bqf").setup({
            preview = { winblend = 0 },
        })
    end,
}
