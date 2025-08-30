---@type Utils.Pack.Spec
return {
	config = function()
		require("lsp_signature").setup({
			always_trigger = true,
			hint_enable = false,
		})
	end,
	src = "https://github.com/ray-x/lsp_signature.nvim",
}
