vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.expandtab = true

vim.o.errorbells = false

vim.o.nu = true
vim.o.wrap = false
vim.o.smartcase = true


vim.o.swapfile = false
vim.o.backup = false

vim.o.ma = true
vim.o.mouse = 'a'
vim.o.guicursor = 'n-v-c-i:block'
vim.o.termguicolors = true
vim.cmd[[colorscheme catppuccin]] -- Set theme to Catppuccin

-- Nerd Tree
vim.g.NERDTreeMinimalUI = 1

-- Ultisnips
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<c-b>'
vim.g.UltiSnipsJumpBackwardTrigger = '<c-z>'
vim.g.UltiSnipsEditSplit = 'vertical'
