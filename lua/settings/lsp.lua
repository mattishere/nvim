local lsp = require('lspconfig')
local cmp = require('cmp')
local servers = {
	'tsserver',
	'angularls',
	'rust_analyzer',
	'pyright',
	'gopls',
	'hls',
	'vimls',
	'html',
	'cssls',
	'jsonls',
	'dockerls',
	'emmet_ls',
    'lua_ls',
    'svelte',
}
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local opts = { noremap=true, silent=true }

	buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format{ async = true }<CR>', opts)
end
for _, server in ipairs(servers) do
	lsp[server].setup {
		on_attach = on_attach,
		capabilities = capabilities
	}
end
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true  }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
	}, {
		{ name = 'buffer' },
	})
})
local diagnostic_opts = {
	underline = true,
	virtual_text = true,
	signs = true,
	update_in_insert = true,
}
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, diagnostic_opts)
