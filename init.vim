if !exists('g:vscode')

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'SirVer/ultisnips'
Plug 'romainl/vim-cool'
Plug 'bling/vim-bufferline'
call plug#end()

set syntax
set number relativenumber
set expandtab
set inccommand=nosplit
set smartcase
set cursorline
set title
set hidden
set splitbelow
set splitright
set textwidth=80
set formatoptions+=t
set shiftwidth=2
set fillchars+=vert:\
set termguicolors

if has('nvim')
  set fcs=eob:\ 
endif

colorscheme onehalfdark

let mapleader = ','
let loaded_netrwPlugin = 1
let g:python3_host_prog = expand('/Users/alexdiaz/.pyenv/shims/python')
let g:vimtex_view_method = 'skim'
let g:sneak#label = 1
let g:UltiSnipsExpandTrigger = "<nop>"
let g:coc_global_extensions = [
  \ 'coc-tsserver', 
  \ 'coc-pairs', 
  \ 'coc-vimlsp', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-eslint',
  \ 'coc-pyright',
  \ 'coc-git',
  \ 'coc-vimtex',
  \ 'coc-highlight',
  \ 'coc-snippets'
\]

highlight Normal gui=none
highlight NonText guibg=none
highlight SignColumn guibg=NONE
highlight Normal guibg=NONE
highlight Sneak none
highlight SneakLabel none
highlight SneakLabelMask none
highlight SneakScope none

noremap <C-E> :CHADopen<CR>

source ~/.config/nvim/coc.vim
source ~/.config/nvim/statusline.vim

endif
