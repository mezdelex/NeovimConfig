return {
	config = function()
		require("ibl").setup({
			scope = {
				show_end = false,
				show_start = false,
			},
		})
	end,
	defer = true,
	src = "https://github.com/lukas-reineke/indent-blankline.nvim",
}
