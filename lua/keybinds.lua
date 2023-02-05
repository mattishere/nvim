vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Nerd Tree
vim.keymap.set('n', '<C-space>', ':NERDTreeToggle<CR>')

-- Nerd Commenter
vim.keymap.set('n', '<C-_>', '<Plug>NERDCommenterToggle<CR>')
vim.keymap.set('v', '<C-_>', '<Plug>NERDCommenterToggle<CR>gv')


vim.keymap.set('n', '<C-w>', ':bd<CR>') -- Close buffer
vim.keymap.set('n', '<C-n>', ':tabnew<CR>') -- Open new buffer

-- Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>') -- File finder
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>') -- Find definitions etc.
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>') -- Buffers