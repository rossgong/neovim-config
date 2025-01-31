-- Put all remaps here

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>p", "<cmd>Oil .<CR>")

--telescope suggested default keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = 'Telescope project grep search' })
vim.keymap.set('n', '<leader>u', function() vim.cmd.Telescope('undo') end, { desc = "Telescope undo" })

-- vim-fugitive (git)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
vim.keymap.set("n", "<leader>gl", function() vim.cmd.Git('log --oneline') end, { desc = "Git log oneline" })

vim.keymap.set("v", "J", ":m '>..1<CR>gv=gv", { desc = 'Move selected' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selected' })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover)

-- Text objects
-- local delimters = { '@' }
--
-- for _, char in ipairs(delimters) do
-- 	local imap = string.format(':<C-u>normal! /%s<CR>:nohl<CR>T%svt%s<CR>', char, char, char);
--
-- 	vim.keymap.set('x', "i" .. char, imap, {
-- 		noremap = true,
-- 		silent = true,
-- 		desc = string.format('between %s text object', char)
-- 	})
-- 	vim.keymap.set('o', "i" .. char, imap, {
-- 		noremap = true,
-- 		silent = true,
-- 		desc = string.format('between %s text object', char)
-- 	})
-- end
