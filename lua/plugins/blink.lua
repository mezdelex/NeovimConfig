---@type Utils.Pack.Spec
return {
	src = "https://github.com/saghen/blink.cmp",
	build = "cargo build --release",
	config = function()
		require("blink.cmp").setup({
			completion = {
				documentation = { auto_show = true },
			},
			keymap = { preset = "enter" },
		})
	end,
}
