vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  use 'justinmk/vim-sneak'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  use 'airblade/vim-rooter'
  use 'romainl/vim-cool'
  use 'tpope/vim-fugitive'
  use 'junegunn/fzf.vim'
  use 'junegunn/fzf'
  use 'justinmk/vim-dirvish'

  use 'lervag/vimtex'
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'jmsv/vscode-javascript-standard'
  use {'James-Yu/LaTeX-Workshop', rtp = 'snippets'}

  use 'dracula/vim'
  use 'pineapplegiant/spaceduck'
end)
