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

-- use folds
-- vim.opt.foldmethod = 'indent'
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'

vim.g.do_filetype_lua = 1

vim.opt.textwidth = 80

-- remove tildas
vim.cmd('set fillchars-=vert:\\|')

-- remove virticle split
vim.cmd('set fillchars-=vert:\\|')

vim.cmd('set nowrap')

-- vim.cmd('set guifont=Consolas')

vim.cmd('colorscheme monokai_pro')

-- coq completion settings
vim.cmd('let g:coq_settings = { \'auto_start\': \'shut-up\' }')
