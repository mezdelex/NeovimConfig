return {
	"neovim/nvim-lspconfig",
	config = function()
		local blink = require("blink.cmp")
		local lspconfig = require("lspconfig")
		local signs = {
			Error = "",
			Hint = "",
			Info = "",
			Warn = "",
		}

		lspconfig.util.default_config.capabilities =
			vim.tbl_deep_extend("force", lspconfig.util.default_config.capabilities, blink.get_lsp_capabilities())
		require("mason").setup({
			registries = { "github:crashdummyy/mason-registry", "github:mason-org/mason-registry" },
		})
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					lspconfig[server_name].setup({})
				end,
				lua_ls = function()
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,
				ts_ls = function()
					lspconfig.ts_ls.setup({
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
									location = require("mason-registry")
										.get_package("vue-language-server")
										:get_install_path() .. "/node_modules/@vue/language-server",
									name = "@vue/typescript-plugin",
								},
							},
						},
					})
				end,
			},
		})
		require("roslyn").setup()

		blink.setup({
			fuzzy = {
				prebuilt_binaries = { download = false },
			},
			keymap = { preset = "enter" },
			signature = { enabled = true },
		})

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, {
				numhl = hl,
				text = icon,
				texthl = hl,
			})
		end
		vim.diagnostic.config({ update_in_insert = true })
	end,
	dependencies = {
		"rafamadriz/friendly-snippets",
		"seblyng/roslyn.nvim",
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
		{ "saghen/blink.cmp", version = "*" },
	},
}
