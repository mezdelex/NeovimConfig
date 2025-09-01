return { ---@type Utils.Pack.Spec
	config = function()
		require("quicker").setup()
	end,
	defer = true,
	src = "https://github.com/stevearc/quicker.nvim",
}
