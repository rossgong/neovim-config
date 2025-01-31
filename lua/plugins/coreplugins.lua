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
		"blazkowolf/gruber-darker.nvim",
		priority = 1000,
		config = function()
			require("gruber-darker").load()
		end
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "zig", "javascript", "html", "java", "kotlin", "go" },
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup()
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

	}
}
