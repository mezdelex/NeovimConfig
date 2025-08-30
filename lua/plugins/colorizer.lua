---@type Utils.Pack.Spec
return {
	config = function()
		require("colorizer").setup()
	end,
	defer = true,
	src = "https://github.com/catgoose/nvim-colorizer.lua",
}
