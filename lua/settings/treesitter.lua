require('nvim-treesitter.configs').setup {
    ensure_installed = { 'go', 'haskell', 'rust', 'typescript', 'javascript', 'python', 'html', 'css', 'scss' },

    highlight = {
        enable = true,
    },
}
