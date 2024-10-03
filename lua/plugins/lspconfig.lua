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

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local opts = {
					buffer = event.buf,
					silent = true,
				}

				vim.keymap.set("n", "<a-f>", vim.lsp.buf.format, opts)
				vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
			end,
		})

		require("mason").setup()
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
				omnisharp = function()
					lspconfig.omnisharp.setup({
						handlers = {
							["textDocument/definition"] = require("omnisharp_extended").handler,
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

		require("luasnip.loaders.from_vscode").lazy_load()
		cmp.setup({
			mapping = {
				["<cr>"] = cmp.mapping.confirm({
					select = true,
				}),
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
		cmp.setup.cmdline("/", {
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
		vim.diagnostic.config({
			update_in_insert = true,
		})
	end,
	dependencies = {
		"Hoffs/omnisharp-extended-lsp.nvim",
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-path",
		"hrsh7th/nvim-cmp",
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
		"williamboman/mason-lspconfig.nvim",
		"williamboman/mason.nvim",
	},
}
