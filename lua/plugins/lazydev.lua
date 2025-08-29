---@type Utils.Pack.Spec
return {
	src = "https://github.com/folke/lazydev.nvim",
	config = function()
		require("lazydev").setup({
			library = {
				"nvim-dap-ui",
				"nvim-treesitter-textobjects",
			},
		})
	end,
}
