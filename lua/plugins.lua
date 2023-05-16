vim.cmd ([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    use { 'catppuccin/nvim', as = "catppuccin" } -- Theme

    use 'preservim/nerdcommenter' -- Commenting

    use 'nvim-tree/nvim-tree.lua' -- File tree

    use 'jiangmiao/auto-pairs' -- Symbol pairing

    use 'hrsh7th/cmp-nvim-lsp' -- Code suggestions
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use 'neovim/nvim-lspconfig' -- LSP

    --use {
        --'lewis6991/gitsigns.nvim',
        --config = function()
            --require('gitsigns').setup()
        --end
        --} -- Git

    use 'nvim-tree/nvim-web-devicons' -- Nerd Font icons

    use 'nvim-lua/plenary.nvim' -- Lua functions

    use 'nvim-lua/popup.nvim'

    use 'nvim-telescope/telescope.nvim' -- File searching

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    } -- Status bar

    use {'akinsho/bufferline.nvim', tag = '*', requires = 'nvim-tree/nvim-web-devicons' } -- Buffers bar at the top
    use 'moll/vim-bbye' -- Keeps the layout as it is after closing a buffer

    use 'nvim-treesitter/nvim-treesitter' -- Syntax highlighting
end)
