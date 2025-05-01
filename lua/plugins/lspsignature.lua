return {
	"ray-x/lsp_signature.nvim",
	config = function()
		require("lsp_signature").setup({
			always_trigger = true,
			hint_enable = false,
		})
	end,
}
