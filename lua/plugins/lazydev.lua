---@type Utils.Pack.Spec
return {
	config = function()
		require("lazydev").setup({
			library = {
				"nvim-dap-ui",
				"nvim-treesitter-textobjects",
			},
		})
	end,
	src = "https://github.com/folke/lazydev.nvim",
}
