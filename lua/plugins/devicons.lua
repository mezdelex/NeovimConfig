---@type Utils.Pack.Spec
return {
	config = function()
		require("nvim-web-devicons").setup({
			color_icons = true,
			default = true,
		})
	end,
	src = "https://github.com/nvim-tree/nvim-web-devicons",
}
