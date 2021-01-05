vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use 'svermeulen/vimpeccable'

  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'justinmk/vim-sneak'
  use 'airblade/vim-rooter'
  use 'romainl/vim-cool'
  use 'tpope/vim-fugitive'

  use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use 'justinmk/vim-dirvish'
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'lervag/vimtex'

  use 'pineapplegiant/spaceduck'
end)
