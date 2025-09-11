return {
	config = function()
		require("registers").setup({
			show_empty = false,
			window = {
				border = "rounded",
				transparency = 0,
			},
		})
	end,
	defer = true,
	src = "https://github.com/tversteeg/registers.nvim",
}
