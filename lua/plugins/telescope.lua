return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim', 'debugloop/telescope-undo.nvim', "nvim-telescope/telescope-ui-select.nvim" },
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = { require("telescope.themes").get_dropdown {} }
				}
			};

			require("telescope").load_extension("ui-select");
			require("telescope").load_extension("undo");
		end
	}
}
