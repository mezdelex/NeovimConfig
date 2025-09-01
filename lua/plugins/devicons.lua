return { ---@type Utils.Pack.Spec
	config = function()
		require("nvim-web-devicons").setup({
			color_icons = true,
			default = true,
		})
	end,
	defer = true,
	src = "https://github.com/nvim-tree/nvim-web-devicons",
}
