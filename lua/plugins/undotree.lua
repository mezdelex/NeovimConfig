return {
    "mbbill/undotree",
    config = function()
        vim.g.undotree_DiffCommand = "fc"

        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
}
