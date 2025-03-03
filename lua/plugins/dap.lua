return {
	"rcarriga/nvim-dap-ui",
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local options = { silent = true }

		require("neodev").setup({
			library = {
				plugins = { "nvim-dap-ui" },
				types = true,
			},
		})

		require("dap-go").setup()
		require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/Scripts/python.exe")
		dap.adapters.coreclr = {
			args = { "--interpreter=vscode" },
			command = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe",
			type = "executable",
		}
		dap.adapters.codelldb = {
			executable = {
				args = { "--port", "${port}" },
				command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb.exe",
			},
			port = "${port}",
			type = "server",
		}
		dap.configurations.cs = {
			{
				program = function()
					return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
				end,
				request = "launch",
				type = "coreclr",
			},
		}
		dap.configurations.rust = {
			{
				cargo = {
					args = { "build" },
				},
				name = "Build",
				program = function()
					return vim.fn.input("Path to exe: ", vim.fn.getcwd() .. "/", "file")
				end,
				request = "launch",
				setupCommands = {
					{ text = '-interpreter-exec console "settings set target.x86-disassembly-flavor none"' },
				},
				type = "codelldb",
			},
			{
				cargo = {
					args = { "test", "--no-run" },
				},
				name = "Test",
				program = function()
					return vim.fn.input("Path to exe: ", vim.fn.getcwd() .. "/", "file")
				end,
				request = "launch",
				setupCommands = {
					{ text = '-interpreter-exec console "settings set target.x86-disassembly-flavor none"' },
				},
				type = "codelldb",
			},
		}
		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_exited["dapui_config"] = dapui.close
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dapui.setup()

		vim.fn.sign_define("DapBreakpoint", {
			linehl = "debugBreakpoint",
			numhl = "debugBreakpoint",
			text = "",
			texthl = "debugBreakpoint",
		})
		vim.fn.sign_define("DapStopped", {
			linehl = "debugPC",
			numhl = "debugPC",
			text = "",
			texthl = "debugPC",
		})

		vim.keymap.set("n", "<c-h>", dap.step_back, options)
		vim.keymap.set("n", "<c-j>", dap.step_into, options)
		vim.keymap.set("n", "<c-k>", dap.step_out, options)
		vim.keymap.set("n", "<c-l>", dap.step_over, options)
		vim.keymap.set("n", "<leader>B", dap.terminate, options)
		vim.keymap.set("n", "<leader>b", dap.continue, options)
		vim.keymap.set("n", "gb", dap.toggle_breakpoint, options)
	end,
	dependencies = {
		"folke/neodev.nvim",
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python",
		"nvim-neotest/nvim-nio",
	},
}
