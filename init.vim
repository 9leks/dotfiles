if !exists('g:vscode')

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'SirVer/ultisnips'
Plug 'romainl/vim-cool'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ap/vim-buftabline'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
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
let g:vimtex_quickfix_mode=0
let g:sneak#label = 1
let g:UltiSnipsExpandTrigger = '<nop>'
let g:coc_global_extensions = [
  \ 'coc-tsserver', 
  \ 'coc-vimlsp', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-eslint',
  \ 'coc-pyright',
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

function! s:find_files()
    let git_dir = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
    if git_dir != ''
        execute 'GFiles' git_dir
    else
        execute 'Files'
    endif
endfunction
command! ProjectFiles execute s:find_files()

nnoremap <silent><Leader>b :FZFMru<CR>
nnoremap <silent><Leader>l :Lines<CR>
nnoremap <silent><C-p> :ProjectFiles<CR>
nnoremap <silent><C-e> :CHADopen<CR>
nnoremap <silent><C-a> :bprev<CR>
nnoremap <silent><C-s> :bnext<CR>

augroup AutoCmds
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd User VimtexEventInitPost VimtexCompile
  autocmd BufEnter * silent! lcd %:p:h
augroup END

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
