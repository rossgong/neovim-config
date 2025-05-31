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
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
}
