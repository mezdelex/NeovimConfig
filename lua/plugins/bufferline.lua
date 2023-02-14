return {
    'akinsho/bufferline.nvim',
    config = function()
        require('bufferline').setup({
            highlights = {
                buffer = { italic = false },
                buffer_selected = { italic = false },
                buffer_visible = { italic = false },
                diagnostic = { italic = false },
                diagnostic_selected = { italic = false },
                diagnostic_visible = { italic = false },
                duplicate = { italic = false },
                duplicate_selected = { italic = false },
                duplicate_visible = { italic = false },
                hint = { italic = false },
                hint_selected = { italic = false },
                hint_visible = { italic = false },
                pick = { italic = false },
                pick_selected = { italic = false },
                pick_visible = { italic = false }
            },
            options = { themable = true }
        })
    end
}
