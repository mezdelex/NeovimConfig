local options = { silent = true }

vim.g.mapleader = " "

vim.keymap.set("n", "<a-Q>", ":qa!<cr>", options)
vim.keymap.set("n", "<a-q>", ":qa<cr>", options)

vim.keymap.set("n", "<a-S>", ":wa<cr>", options)
vim.keymap.set("n", "<a-s>", ":w<cr>", options)

vim.keymap.set("n", "<a-C>", ":q<cr>", options)
vim.keymap.set("n", "<a-c>", ":bp|sp|bn|bw!<cr>", options)
vim.keymap.set("n", "<s-tab>", ":bp<cr>", options)
vim.keymap.set("n", "<tab>", ":bn<cr>", options)

vim.keymap.set("n", "<a-i>", "<c-w>s", options)
vim.keymap.set("n", "<a-o>", "<c-w>v", options)

vim.keymap.set("n", "<a-P>", "<c-w>10+", options)
vim.keymap.set("n", "<a-U>", "<c-w>10-", options)
vim.keymap.set("n", "<a-p>", "<c-w>10>", options)
vim.keymap.set("n", "<a-u>", "<c-w>10<", options)

vim.keymap.set("n", "<a-h>", "<c-w>h", options)
vim.keymap.set("n", "<a-j>", "<c-w>j", options)
vim.keymap.set("n", "<a-k>", "<c-w>k", options)
vim.keymap.set("n", "<a-l>", "<c-w>l", options)

vim.keymap.set("n", "[j", "<c-o>", options)
vim.keymap.set("n", "]j", "<c-i>", options)

vim.keymap.set("n", "[q", ":cp<cr>", options)
vim.keymap.set("n", "]q", ":cn<cr>", options)

vim.keymap.set("n", "U", "<c-r>", options)

vim.keymap.set("n", "<a-v>", "<c-v>", options)

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", options)
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", options)

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', options)
