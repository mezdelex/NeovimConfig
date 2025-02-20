return {
	"neovim/nvim-lspconfig",
	config = function()
		local cmp = require("cmp")
		local lspconfig = require("lspconfig")
		local signs = {
			Error = "",
			Hint = "",
			Info = "",
			Warn = "",
		}

		lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
			"force",
			lspconfig.util.default_config.capabilities,
			require("cmp_nvim_lsp").default_capabilities()
		)
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

		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			formatting = {
				format = require("lspkind").cmp_format({
					ellipsis_char = "...",
					maxwidth = function()
						return math.floor(0.5 * vim.o.columns)
					end,
					show_labelDetails = true,
				}),
			},
			mapping = {
				["<c-d>"] = cmp.mapping.scroll_docs(5),
				["<c-n>"] = cmp.mapping.select_next_item(),
				["<c-p>"] = cmp.mapping.select_prev_item(),
				["<c-u>"] = cmp.mapping.scroll_docs(-5),
				["<cr>"] = cmp.mapping.confirm({ select = true }),
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "buffer" },
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "path" },
			},
		})
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "!", "Man" },
					},
				},
			}),
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
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-path",
		"hrsh7th/nvim-cmp",
		"onsails/lspkind.nvim",
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
		"seblyng/roslyn.nvim",
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
	},
}
