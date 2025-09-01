return { ---@type Utils.Pack.Spec
	config = function()
		require("nvim-autopairs").setup()
	end,
	defer = true,
	src = "https://github.com/windwp/nvim-autopairs",
}
