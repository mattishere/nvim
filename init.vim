syntax on

set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set display+=lastline
set encoding=utf-8
set mouse=a
set guicursor=n-v-c-i:block
set completeopt=menu,menuone,noselect

let mapleader = ' '

call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'

Plug 'jiangmiao/auto-pairs'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

Plug 'ryanoasis/vim-devicons'

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

call plug#end()

" Airline
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'

" NerdTree
let NERDTreeQuitOnOpen=1
let g:NERDTreeMinimalUI=1
nmap <C-space> :NERDTreeToggle<CR>

" NerdCommenter
nmap <C-_> <Plug>NERDCommenterToggle<CR>
vmap <C-_> <Plug>NerdCommenterToggle<CR>gv

" Tabs
nmap <C-w> :bd<CR>
nmap <C-n> :tabnew<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>

" Lua Configuration

lua << EOF

local lsp = require('lspconfig')
local cmp = require('cmp')

local servers = {
	'tsserver',
	'angularls',
	'rust_analyzer',
	'pyright',
	'vimls'
}
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local opts = { noremap=true, silent=true }

	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

for _, server in ipairs(servers) do
	lsp[server].setup {
		on_attach = on_attach,
		capabilities = capabilities
	}
end
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true  }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
	}, {
		{ name = 'buffer' },
	})
})

local diagnostic_opts = {
	underline = true,
	virtual_text = true,
	signs = false,
	update_in_insert = true,
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, diagnostic_opts)

EOF

" Theme
colorscheme gruvbox

highlight Normal ctermbg=None
highlight LineNr ctermbg=None
