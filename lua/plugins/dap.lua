return {
    'rcarriga/nvim-dap-ui',
    config = function()
        local colors = require('gruvbox.palette').get_base_colors(vim.o.background)
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

        vim.api.nvim_set_hl(0, 'DapBreakpointSymbol', { fg = colors.red, bg = colors.bg1 })
        vim.api.nvim_set_hl(0, 'DapStoppedSymbol', { fg = colors.green, bg = colors.bg1 })
        vim.api.nvim_set_hl(0, 'DapUIBreakpointsCurrentLine', { fg = colors.yellow })
        vim.api.nvim_set_hl(0, 'DapUIBreakpointsDisabledLine', { fg = colors.gray })
        vim.api.nvim_set_hl(0, 'DapUIBreakpointsInfo', { fg = colors.aqua })
        vim.api.nvim_set_hl(0, 'DapUIBreakpointsLine', { fg = colors.yellow })
        vim.api.nvim_set_hl(0, 'DapUIBreakpointsPath', { fg = colors.blue })
        vim.api.nvim_set_hl(0, 'DapUICurrentFrameName', { fg = colors.purple })
        vim.api.nvim_set_hl(0, 'DapUIDecoration', { fg = colors.purple })
        vim.api.nvim_set_hl(0, 'DapUIEndofBuffer', { fg = colors.bg2 })
        vim.api.nvim_set_hl(0, 'DapUIFloatBorder', { fg = colors.aqua })
        vim.api.nvim_set_hl(0, 'DapUILineNumber', { fg = colors.yellow })
        vim.api.nvim_set_hl(0, 'DapUIModifiedValue', { fg = colors.red })
        vim.api.nvim_set_hl(0, 'DapUIPlayPause', { fg = colors.green })
        vim.api.nvim_set_hl(0, 'DapUIRestart', { fg = colors.green })
        vim.api.nvim_set_hl(0, 'DapUIScope', { fg = colors.blue })
        vim.api.nvim_set_hl(0, 'DapUISource', { fg = colors.fg1 })
        vim.api.nvim_set_hl(0, 'DapUIStepBack', { fg = colors.blue })
        vim.api.nvim_set_hl(0, 'DapUIStepInto', { fg = colors.blue })
        vim.api.nvim_set_hl(0, 'DapUIStepOut', { fg = colors.blue })
        vim.api.nvim_set_hl(0, 'DapUIStepOver', { fg = colors.blue })
        vim.api.nvim_set_hl(0, 'DapUIStop', { fg = colors.red })
        vim.api.nvim_set_hl(0, 'DapUIStoppedThread', { fg = colors.blue })
        vim.api.nvim_set_hl(0, 'DapUIThread', { fg = colors.blue })
        vim.api.nvim_set_hl(0, 'DapUIType', { fg = colors.orange })
        vim.api.nvim_set_hl(0, 'DapUIUnavailable', { fg = colors.gray })
        vim.api.nvim_set_hl(0, 'DapUIWatchesEmpty', { fg = colors.gray })
        vim.api.nvim_set_hl(0, 'DapUIWatchesError', { fg = colors.red })
        vim.api.nvim_set_hl(0, 'DapUIWatchesValue', { fg = colors.yellow })
        vim.api.nvim_set_hl(0, 'DapUIWinSelect', { fg = colors.yellow })

        vim.fn.sign_define('DapBreakpoint',
            {
                linehl = 'DapBreakpoint',
                numhl = 'DapBreakpoint',
                text = '•',
                texthl = 'DapBreakpointSymbol'
            })
        vim.fn.sign_define('DapStopped',
            {
                linehl = 'DapBreakpoint',
                numhl = 'DapBreakpoint',
                text = '•',
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
