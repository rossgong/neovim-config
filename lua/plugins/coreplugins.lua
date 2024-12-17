return {

	-- colorscheme
	{
		'AlexvZyl/nordic.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			require('nordic').load()
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
			  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "zig", "javascript", "html", "java", "kotlin" },
			  sync_install = false,
			  highlight = { enable = true },
			  indent = { enable = true },  
			})
		end
	},
}
