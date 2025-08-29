---@type Utils.Pack.Spec
return {
    src = "https://github.com/stevearc/oil.nvim",
    config = function()
        local oil = require("oil")

        oil.setup({
            view_options = { show_hidden = true },
        })

        vim.keymap.set("n", "<leader>o", oil.open)
    end,
}
