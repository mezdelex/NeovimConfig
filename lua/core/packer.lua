vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    use('L3MON4D3/LuaSnip')
    use('VonHeikemen/lsp-zero.nvim')
    use('akinsho/bufferline.nvim')
    use('ellisonleao/gruvbox.nvim')
    use('glepnir/lspsaga.nvim')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-nvim-lua')
    use('hrsh7th/cmp-path')
    use('hrsh7th/nvim-cmp')
    use('lewis6991/gitsigns.nvim')
    use('mbbill/undotree')
    use('neovim/nvim-lspconfig')
    use('nvim-lua/plenary.nvim')
    use('nvim-lualine/lualine.nvim')
    use('nvim-telescope/telescope.nvim')
    use('nvim-tree/nvim-tree.lua')
    use('nvim-tree/nvim-web-devicons')
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('rafamadriz/friendly-snippets')
    use('saadparwaiz1/cmp_luasnip')
    use('terrortylor/nvim-comment')
    use('theprimeagen/harpoon')
    use('tpope/vim-fugitive')
    use('wbthomason/packer.nvim')
    use('williamboman/mason-lspconfig.nvim')
    use('williamboman/mason.nvim')
    use('windwp/nvim-autopairs')
    use('windwp/nvim-ts-autotag')
end)