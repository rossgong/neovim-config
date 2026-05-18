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

-- LSP
vim.lsp.config['luals'] = {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { { '.luarc.json' }, '.git' },
	settings = {}
}

vim.lsp.enable('luals')

vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', { desc = "LSP Hover" })
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', { desc = "LSP GOTO Defintion" })
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', { desc = "LSP GOTO Declaration" })
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', { desc = "LSP GOTO Implementation" })
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', { desc = "LSP Type Definition" })
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', { desc = "LSP References" })
vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', { desc = "LSP Signature Doc" })
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = "LSP Rename" })
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', { desc = "LSP Reformat" })
vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = "LSP Code Action" })

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
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope keymaps' })

vim.pack.add({ "https://github.com/rebelot/kanagawa.nvim" })
vim.cmd.colorscheme("kanagawa-wave")
