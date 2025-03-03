return {
	"mbbill/undotree",
	config = function()
		local options = { silent = true }

		vim.g.undotree_DiffCommand = "fc"

		vim.keymap.set("n", "<leader>u", ":UndotreeToggle<cr>", options)
	end,
}
