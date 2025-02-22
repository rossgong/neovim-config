-- Put all remaps here

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>p", "<cmd>Oil .<CR>")

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
