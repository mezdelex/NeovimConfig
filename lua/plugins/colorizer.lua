---@type Utils.Pack.Spec
return {
	src = "https://github.com/catgoose/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup()
	end,
}
