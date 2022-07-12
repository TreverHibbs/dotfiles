-- use numbered lines
vim.opt.number = true
vim.opt.relativenumber = true

-- use system clipboard
vim.opt.clipboard = "unnamedplus"

-- enable mouse
vim.opt.mouse = 'a'

-- use spaces for tab
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.softtabstop = 0
vim.opt.tabstop = 8
vim.opt.shiftwidth = 4

vim.opt.termguicolors = true

-- remove tildas
vim.cmd('set fillchars-=vert:\\|')

-- remove virticle split
vim.cmd('set fillchars-=vert:\\|')

-- vim.cmd('set guifont=Consolas')

vim.cmd('colorscheme monokai_pro')
