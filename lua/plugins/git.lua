return {
	{
		'tpope/vim-fugitive',
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
			vim.keymap.set("n", "<leader>gl", function() vim.cmd.Git('log --oneline') end, { desc = "Git log oneline" })
		end
	}
}
