return { ---@type Utils.Pack.Spec
	config = function()
		require("nvim-ts-autotag").setup()
	end,
	defer = true,
	src = "https://github.com/windwp/nvim-ts-autotag",
}
