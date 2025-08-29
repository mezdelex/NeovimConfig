local utils_pack = require("utils.pack")

vim.api.nvim_create_user_command("PackBuild", utils_pack.build, {})
vim.api.nvim_create_user_command("PackUpdate", utils_pack.update, {})
vim.g.mapleader = " "
vim.loader.enable()

utils_pack.load()
