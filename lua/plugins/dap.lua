return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("lazydev").setup({
            library = { "nvim-dap-ui" },
        })

        require("dap-go").setup()
        require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/Scripts/python.exe")
        dap.adapters.codelldb = {
            executable = {
                args = { "--port", "${port}" },
                command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb.exe",
            },
            port = "${port}",
            type = "server",
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
        dap.adapters.coreclr = {
            args = { "--interpreter=vscode" },
            command = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe",
            type = "executable",
        }
        dap.configurations.cs = {
            {
                name = "Build",
                program = function()
                    return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
                end,
                request = "launch",
                type = "coreclr",
            },
        }
        dap.listeners.before.attach.dapui_config = dapui.open
        dap.listeners.before.event_exited.dapui_config = dapui.close
        dap.listeners.before.event_terminated.dapui_config = dapui.close
        dap.listeners.before.launch.dapui_config = dapui.open
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

        vim.keymap.set("n", "<c-h>", dap.step_back)
        vim.keymap.set("n", "<c-j>", dap.step_into)
        vim.keymap.set("n", "<c-k>", dap.step_out)
        vim.keymap.set("n", "<c-l>", dap.step_over)
        vim.keymap.set("n", "<leader>B", dap.terminate)
        vim.keymap.set("n", "<leader>b", dap.continue)
        vim.keymap.set("n", "gb", dap.toggle_breakpoint)
    end,
    dependencies = {
        "folke/lazydev.nvim",
        "leoluz/nvim-dap-go",
        "mfussenegger/nvim-dap-python",
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
    },
}
