return {
    'rcarriga/nvim-dap-ui',
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')
        local opts = { noremap = true, silent = true }

        require('neodev').setup({
            library = { plugins = { 'nvim-dap-ui' }, types = true }
        })

        dap.adapters.coreclr = {
            args = { '--interpreter=vscode' },
            command = vim.fn.stdpath('data') .. '/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe',
            type = 'executable'
        }
        dap.configurations.cs = {
            {
                name = 'launch - netcoredbg',
                program = function() return vim.fn.input('Path to dll: ', vim.fn.getcwd() .. '/bin/Debug/', 'file') end,
                request = 'launch',
                type = 'coreclr'
            }
        }
        dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
        dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
        dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
        dapui.setup()

        vim.fn.sign_define('DapBreakpoint',
            {
                linehl = 'DapBreakpoint',
                numhl = 'DapBreakpoint',
                text = '',
                texthl = 'DapBreakpointSymbol'
            })
        vim.fn.sign_define('DapStopped',
            {
                linehl = 'DapBreakpoint',
                numhl = 'DapBreakpoint',
                text = '',
                texthl = 'DapStoppedSymbol'
            })

        vim.keymap.set('n', '<down>', function() dap.step_into() end, opts)
        vim.keymap.set('n', '<leader>b', function() dap.continue() end, opts)
        vim.keymap.set('n', '<right>', function() dap.step_over() end, opts)
        vim.keymap.set('n', '<up>', function() dap.step_out() end, opts)
        vim.keymap.set('n', 'gb', function() dap.toggle_breakpoint() end, opts)
    end,
    dependencies = {
        'folke/neodev.nvim',
        'mfussenegger/nvim-dap'
    }
}
