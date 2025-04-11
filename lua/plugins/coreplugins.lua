return {

	-- colorscheme
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			-- require('nordic').load()
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "lua", "vim", "vimdoc", "query" },
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	{
		'echasnovski/mini.ai',
		config = function()
			local delimiters = { '|' }
			local delimit_objects = {}

			for _, char in ipairs(delimiters) do
				delimit_objects[char] = require('mini.ai').gen_spec.pair(char, char, { type = 'greedy' })
			end

			require('mini.ai').setup({
				custom_textobjects = delimit_objects
			})
		end

	},
	{ 'tpope/vim-surround' }
}
