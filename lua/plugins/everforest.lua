---@type Utils.Pack.Spec
return {
	config = function()
		vim.g.everforest_disable_italic_comment = true
		vim.g.everforest_enable_italic = false

		vim.cmd.colorscheme("everforest")
	end,
	src = "https://github.com/sainnhe/everforest",
}
