---@type Utils.Pack.Spec
return {
	config = function()
		require("blink.cmp").setup({
			completion = {
				documentation = { auto_show = true },
			},
			keymap = { preset = "enter" },
		})
	end,
	data = { build = "cargo build --release" },
	defer = true,
	src = "https://github.com/saghen/blink.cmp",
}
