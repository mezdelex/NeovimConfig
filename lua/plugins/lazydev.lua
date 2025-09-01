return { ---@type Utils.Pack.Spec
	config = function()
		require("lazydev").setup({
			library = {
				"nvim-dap-ui",
				"nvim-treesitter-textobjects",
			},
		})
	end,
	defer = true,
	src = "https://github.com/folke/lazydev.nvim",
}
