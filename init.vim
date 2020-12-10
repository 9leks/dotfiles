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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-buftabline'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
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
set textwidth=120
set formatoptions+=t
set shiftwidth=2
set fillchars+=vert:\
set termguicolors
set undofile

if has('nvim')
  set fcs=eob:\ 
endif

colorscheme onehalfdark
lua require'colorizer'.setup()

let mapleader = ','
let loaded_netrwPlugin = 1
let g:python3_host_prog = expand('/Users/alexdiaz/.pyenv/versions/3.8.6/bin/python')
let g:vimtex_view_method = 'skim'
let g:sneak#label = 1
let g:UltiSnipsExpandTrigger = '<nop>'
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

nnoremap <silent><C-E> :CHADopen<CR>
nnoremap <silent><C-a> :bprev<CR>
nnoremap <silent><C-s> :bnext<CR>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

source ~/.config/nvim/coc.vim
source ~/.config/nvim/statusline.vim

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", 
  highlight = {
    enable = true,
  },
}
EOF

endif
