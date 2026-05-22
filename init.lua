-- Any core settings go here
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.smartindent = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- blinking edit cursor
local blink = "blinkwait1000-blinkon1000-blinkoff1000"

vim.opt.guicursor = string.format("n-v-c-sm:block,i-ci-ve:block-%s,r-cr-o:hor20-%s", blink, blink)

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'


vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

--ColorScheme
vim.pack.add({ "https://github.com/rebelot/kanagawa.nvim" })
vim.cmd.colorscheme("kanagawa-wave")

-- file manager
-- Dependencies (does this need to be seperate?
vim.pack.add({ 'https://github.com/nvim-tree/nvim-web-devicons' })
vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })

require('oil').setup({
	columns = { 'icon' },
	view_options = {
		show_hidden = true
	}
})

vim.api.nvim_create_user_command('Ex', 'Oil .', {}) -- Ex alias

-- LSP
vim.o.autocomplete = true
vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }
vim.o.pumheight = 8

vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })
vim.lsp.enable('lua_ls')

vim.lsp.config('bashls', {
	filetypes = { 'bash', 'sh', 'zsh' }
})
vim.lsp.enable('bashls')

vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, { desc = "LSP Code Action" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "LSP GOTO Declaration" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP GOTO Defintion" })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = "LSP GOTO Implementation" })
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
vim.keymap.set('n', 'gn', vim.lsp.buf.rename, { desc = "LSP Rename" })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "LSP References" })
vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { desc = "LSP Signature Doc" })
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { desc = "LSP Type Definition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "LSP Hover" })
vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, { desc = "LSP Reformat" })

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end
})
-- mini.ai setup
vim.pack.add({ { src = 'https://github.com/nvim-mini/mini.ai', version = 'stable' } })
local delimiters = { '|' }
local delimit_objects = {}

for _, char in ipairs(delimiters) do
	delimit_objects[char] = require('mini.ai').gen_spec.pair(char, char, { type = 'greedy' })
end

require('mini.ai').setup({
	custom_textobjects = delimit_objects
})

-- nvim-surround
vim.pack.add({ {
	src = "https://github.com/kylechui/nvim-surround",
	version = vim.version.range("4.x"),
} })

-- telescope

--dependencies
vim.pack.add({
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/debugloop/telescope-undo.nvim',
	'https://github.com/nvim-telescope/telescope-ui-select.nvim',
})

vim.pack.add({ { src = 'https://github.com/nvim-telescope/telescope.nvim' } })

require("telescope").setup {
	extensions = {
		["ui-select"] = { require("telescope.themes").get_dropdown {} }
	}
};

require("telescope").load_extension("ui-select");
require("telescope").load_extension("undo");


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope keymaps' })


vim.pack.add({
    "https://github.com/OXY2DEV/markview.nvim",
})

require("markview").setup({
    -- preview = { enable = false } -- COnsider uncommenteing if annoying
});

