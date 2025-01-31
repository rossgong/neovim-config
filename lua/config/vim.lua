-- Any core settings go here
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.smartindent = true

-- blinking edit cursor
local blink = "blinkwait1000-blinkon1000-blinkoff1000"

vim.opt.guicursor = string.format("n-v-c-sm:block,i-ci-ve:block-%s,r-cr-o:hor20-%s", blink, blink)

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.cmd.colorscheme('gruber-darker')
