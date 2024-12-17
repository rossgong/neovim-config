return {
	{
		'neovim/nvim-lspconfig',
		dependencies = { { 'hrsh7th/cmp-nvim-lsp' }, { 'hrsh7th/nvim-cmp' }, },
		config = function()
			local defaults = require('lspconfig').util.default_config

			defaults.capabilities = vim.tbl_deep_extend(
				'force',
				defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)

			vim.opt.signcolumn = 'yes'

			vim.api.nvim_create_autocmd('LspAttach', {
				desc = 'LSP actions',
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
					vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
					vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
					vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
					vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
					vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
					vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
					vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
					vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
					vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
				end,
			})
		end
	},


	{
		"williamboman/mason.nvim"
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
		config = function()
			local mason = require('mason')
			local masonLspConfig = require('mason-lspconfig')


			mason.setup({})

			masonLspConfig.setup({
				ensure_installed = { 'lua_ls' },
				handlers = {
					function(server_name)
						require('lspconfig')[server_name].setup({})
					end,

					lua_ls = function()
						require('lspconfig').lua_ls.setup({
							on_init = function(client)
								if client.workspace_folders then
									local path = client.workspace_folders[1].name
									if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
										return
									end
								end

								client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
									runtime = {
										-- Tell the language server which version of Lua you're using
										-- (most likely LuaJIT in the case of Neovim)
										version = 'LuaJIT'
									},
									-- Make the server aware of Neovim runtime files
									workspace = {
										checkThirdParty = false,
										library = {
											vim.env.VIMRUNTIME
											-- Depending on the usage, you might want to add additional paths here.
											-- "${3rd}/luv/library"
											-- "${3rd}/busted/library",
										}
										-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
										-- library = vim.api.nvim_get_runtime_file("", true)
									}
								})
							end,
							settings = {
								Lua = {}
							}
						})
					end
				}
			})
		end
	}
}
