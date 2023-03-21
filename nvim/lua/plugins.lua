local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end

    return false
end

local bootstrap = ensure_packer()

return require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- themes
    use 'michaeldyrynda/carbon'
    use 'rebelot/kanagawa.nvim'
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use { 'catppuccin/nvim', as = 'catppuccin' }

    -- ui
    use 'romainl/vim-cool'
    use 'echasnovski/mini.nvim'
    use 'stevearc/dressing.nvim'
    use 'akinsho/bufferline.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'akinsho/git-conflict.nvim'
    use 'kevinhwang91/nvim-hlslens'
    use 'lukas-reineke/indent-blankline.nvim'
    use { 'RRethy/vim-hexokinase', run = 'make hexokinase' }
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', requires = 'nvim-telescope/telescope.nvim' }

    -- lsp, language support
    use 'udalov/kotlin-vim'
    use 'j-hui/fidget.nvim'
    use 'folke/neodev.nvim'
    use 'neovim/nvim-lspconfig'
    use 'rafamadriz/friendly-snippets'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'mrjones2014/nvim-ts-rainbow', wants = 'nvim-treesitter' }
    use { 'kosayoda/nvim-lightbulb', requires = 'antoinemadec/FixCursorHold.nvim' }
    use { 'hrsh7th/nvim-cmp',
        requires = {
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
    use 'rmagatti/auto-session'
    use 'notjedi/nvim-rooter.lua'
    use 'lewis6991/impatient.nvim'
    use 'NMAC427/guess-indent.nvim'

    if bootstrap then
        require 'packer'.sync()
    end
end)
