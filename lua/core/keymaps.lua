vim.g.mapleader = " "

vim.keymap.set("n", "<a-Q>", ":qa!<cr>")
vim.keymap.set("n", "<a-q>", ":qa<cr>")

vim.keymap.set("n", "<a-S>", ":wa<cr>")
vim.keymap.set("n", "<a-s>", ":w<cr>")

vim.keymap.set("n", "<a-C>", ":q<cr>")
vim.keymap.set("n", "<a-c>", ":bp|sp|bn|bw!<cr>")
vim.keymap.set("n", "<s-tab>", ":bp<cr>")
vim.keymap.set("n", "<tab>", ":bn<cr>")

vim.keymap.set("n", "<a-i>", "<c-w>s")
vim.keymap.set("n", "<a-o>", "<c-w>v")

vim.keymap.set("n", "<a-P>", "<c-w>10+")
vim.keymap.set("n", "<a-U>", "<c-w>10-")
vim.keymap.set("n", "<a-p>", "<c-w>10>")
vim.keymap.set("n", "<a-u>", "<c-w>10<")

vim.keymap.set("n", "<a-h>", "<c-w>h")
vim.keymap.set("n", "<a-j>", "<c-w>j")
vim.keymap.set("n", "<a-k>", "<c-w>k")
vim.keymap.set("n", "<a-l>", "<c-w>l")

vim.keymap.set("n", "[j", "<c-o>")
vim.keymap.set("n", "]j", "<c-i>")

vim.keymap.set("n", "[q", ":cp<cr>")
vim.keymap.set("n", "]q", ":cn<cr>")

vim.keymap.set("n", "U", "<c-r>")

vim.keymap.set("n", "<a-v>", "<c-v>")

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
