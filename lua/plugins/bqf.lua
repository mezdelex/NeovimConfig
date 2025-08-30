---@type Utils.Pack.Spec
return {
	config = function()
		require("bqf").setup({
			preview = { winblend = 0 },
		})
	end,
	defer = true,
	src = "https://github.com/kevinhwang91/nvim-bqf",
}
