---@type Utils.Pack.Spec
return {
	config = function()
		vim.g.undotree_DiffCommand = "fc"

		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end,
	src = "https://github.com/mbbill/undotree",
}
