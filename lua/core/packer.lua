vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    use('ellisonleao/gruvbox.nvim')
    use('mbbill/undotree')
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('tpope/vim-fugitive')
    use('wbthomason/packer.nvim')
    use({'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = {{'nvim-lua/plenary.nvim'}}})
    use({'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}})
    use({'VonHeikemen/lsp-zero.nvim', requires = {
        {'L3MON4D3/LuaSnip'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},
        {'hrsh7th/cmp-path'},
        {'hrsh7th/nvim-cmp'},
        {'neovim/nvim-lspconfig'},
        {'rafamadriz/friendly-snippets'},
        {'saadparwaiz1/cmp_luasnip'},
        {'williamboman/mason-lspconfig.nvim'},
        {'williamboman/mason.nvim'},
    }
})
end)
