---@type Utils.Pack.Spec
return {
	config = function()
		require("kulala").setup({
			global_keymaps = true,
			global_keymaps_prefix = "<leader>k",
		})
	end,
	defer = true,
	src = "https://github.com/mistweaverco/kulala.nvim",
}
