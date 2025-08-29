local utils_shared = require("utils.shared")

return {
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
	},
	init_options = {
		plugins = {
			{
				languages = { "vue" },
				location = utils_shared.data_path
					.. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
				name = "@vue/typescript-plugin",
			},
		},
	},
}
