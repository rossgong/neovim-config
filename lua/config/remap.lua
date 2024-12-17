-- Put all remaps here

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>p", vim.cmd.Ex)

--telescope suggested default keybinds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = 'Telescope project grep search' })
vim.keymap.set('n', '<leader>u', function() vim.cmd.Telescope('undo') end, { desc = "Telescope undo"})

-- vim-fugitive (git)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status"})
vim.keymap.set("n", "<leader>gl", function() vim.cmd.Git('log --oneline') end, {desc = "Git log oneline"})
