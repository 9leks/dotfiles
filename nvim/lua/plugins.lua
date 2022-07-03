return require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'vimpostor/vim-tpipeline'

    -- themes
    use 'michaeldyrynda/carbon'
    use 'rebelot/kanagawa.nvim'
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use { '9leks/catppuccin.nvim', as = 'catppuccin' }

    -- ui
    use 'romainl/vim-cool'
    use 'folke/zen-mode.nvim'
    use 'rcarriga/nvim-notify'
    use 'echasnovski/mini.nvim'
    use 'junegunn/limelight.vim'
    use 'stevearc/dressing.nvim'
    use 'akinsho/bufferline.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'tversteeg/registers.nvim'
    use 'lewis6991/satellite.nvim'
    use 'akinsho/git-conflict.nvim'
    use 'kevinhwang91/nvim-hlslens'
    use 'lukas-reineke/indent-blankline.nvim'
    use { 'RRethy/vim-hexokinase', run = 'make hexokinase' }
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', requires = 'nvim-telescope/telescope.nvim' }

    -- lsp, language support
    use 'lervag/vimtex'
    use 'j-hui/fidget.nvim'
    use 'folke/lua-dev.nvim'
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'
    use 'rafamadriz/friendly-snippets'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'p00f/nvim-ts-rainbow', wants = 'nvim-treesitter' }
    use { 'kosayoda/nvim-lightbulb', requires = 'antoinemadec/FixCursorHold.nvim' }
    use { 'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-omni',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'saadparwaiz1/cmp_luasnip',
        }
    }

    -- editing
    use 'tpope/vim-repeat'
    use 'tpope/vim-abolish'
    use 'tpope/vim-surround'
    use 'bkad/CamelCaseMotion'
    use 'windwp/nvim-autopairs'
    use 'numToStr/Comment.nvim'
    use 'ggandor/lightspeed.nvim'
    use 'junegunn/vim-easy-align'
    use 'urxvtcd/vim-indent-object'
    use 'bronson/vim-visual-star-search'

    -- utils
    use 'mbbill/undotree'
    use '9leks/auto-session'
    use 'notjedi/nvim-rooter.lua'
    use 'lewis6991/impatient.nvim'
    use 'NMAC427/guess-indent.nvim'
end)
