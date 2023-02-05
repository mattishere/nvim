vim.cmd ([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    use 'catppuccin/nvim' -- Theme

    use 'preservim/nerdcommenter' -- Commenting

    use 'preservim/nerdtree' -- File tree

    use 'jiangmiao/auto-pairs' -- Symbol pairing

    use 'hrsh7th/cmp-nvim-lsp' -- Code suggestions
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use 'neovim/nvim-lspconfig' -- LSP

    use 'ryanoasis/vim-devicons' -- Nerd Font icons

    use 'nvim-lua/plenary.nvim' -- Lua functions

    use 'nvim-telescope/telescope.nvim' -- File searching

    use 'nvim-lualine/lualine.nvim' -- Status bar

    use {'akinsho/bufferline.nvim', tag = 'v3.*', requires = 'ryanoasis/vim-devicons' } -- Buffers bar at the top

    use 'nvim-treesitter/nvim-treesitter' -- Syntax highlighting

end)