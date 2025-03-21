return {
    "akinsho/bufferline.nvim",
    config = function()
        local bufferline = require("bufferline")

        bufferline.setup({
            options = {
                indicator = { style = "none" },
                separator_style = {},
                show_buffer_close_icons = false,
                style_preset = bufferline.style_preset.no_italic,
            },
        })
    end,
}
