return { ---@type Utils.Pack.Spec
	config = function()
		local codeaction = require("tiny-code-action")

		codeaction.setup({
			picker = {
				"buffer",
				opts = {
					auto_preview = true,
					hotkeys = true,
					hotkeys_mode = "sequential",
				},
			},
		})

		vim.keymap.set("n", "<leader>.", codeaction.code_action)
	end,
	defer = true,
	src = "https://github.com/rachartier/tiny-code-action.nvim",
}
