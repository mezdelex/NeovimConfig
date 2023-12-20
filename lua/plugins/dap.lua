return {
    'rcarriga/nvim-dap-ui',
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')
        local opts = { silent = true }

        require('neodev').setup({
            library = { plugins = { 'nvim-dap-ui' }, types = true }
        })

        require('dap-go').setup()
        require('dap-python').setup(vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/Scripts/python.exe')
        dap.adapters.coreclr = {
            args = { '--interpreter=vscode' },
            command = vim.fn.stdpath('data') .. '/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe',
            type = 'executable'
        }
        dap.adapters.codelldb = {
            executable = {
                command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb.exe',
                args = { '--port', '${port}' }
            },
            port = '${port}',
            type = 'server'
        }
        dap.configurations.cs = {
            {
                program = function()
                    return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/', 'file')
                end,
                request = 'launch',
                type = 'coreclr'
            }
        }
        dap.configurations.rust = {
            {
                cargo = { args = { 'build' } },
                name = 'Build',
                program = function()
                    return vim.fn.input('Path to exe: ', vim.fn.getcwd() .. '/', 'file')
                end,
                request = 'launch',
                setupCommands = {
                    { text = '-interpreter-exec console "settings set target.x86-disassembly-flavor none"' }
                },
                type = 'codelldb'
            },
            {
                cargo = { args = { 'test', '--no-run' } },
                name = 'Test',
                program = function()
                    return vim.fn.input('Path to exe: ', vim.fn.getcwd() .. '/', 'file')
                end,
                request = 'launch',
                setupCommands = {
                    { text = '-interpreter-exec console "settings set target.x86-disassembly-flavor none"' }
                },
                type = 'codelldb'
            }
        }
        dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
        dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
        dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
        dapui.setup()

        vim.fn.sign_define('DapBreakpoint', {
            linehl = 'debugBreakpoint',
            numhl = 'debugBreakpoint',
            text = '',
            texthl = 'debugBreakpoint'
        })
        vim.fn.sign_define('DapStopped', {
            linehl = 'debugPC',
            numhl = 'debugPC',
            text = '',
            texthl = 'debugPC'
        })

        vim.keymap.set('n', '<down>', function() dap.step_into() end, opts)
        vim.keymap.set('n', '<leader>B', function() dap.terminate() end, opts)
        vim.keymap.set('n', '<leader>b', function() dap.continue() end, opts)
        vim.keymap.set('n', '<left>', function() dap.step_back() end, opts)
        vim.keymap.set('n', '<right>', function() dap.step_over() end, opts)
        vim.keymap.set('n', '<up>', function() dap.step_out() end, opts)
        vim.keymap.set('n', 'gb', function() dap.toggle_breakpoint() end, opts)
    end,
    dependencies = {
        'folke/neodev.nvim',
        'leoluz/nvim-dap-go',
        'mfussenegger/nvim-dap',
        'mfussenegger/nvim-dap-python'
    }
}
