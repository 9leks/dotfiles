call plug#begin()
" Buffer handling
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'ap/vim-buftabline'

" Project management
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'

" Tools
Plug 'justinmk/vim-sneak'
Plug 'lervag/vimtex'
Plug 'brennier/quicktex'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-rooter'
Plug 'aymericbeaumet/vim-symlink'

" Convenience
Plug 'luochen1990/rainbow'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'romainl/vim-cool'
Plug 'valloric/MatchTagAlways'
Plug 'AndrewRadev/tagalong.vim'
Plug 'Yggdroot/indentLine'
Plug 'bkad/CamelCaseMotion'
Plug 'dstein64/nvim-scrollview'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jmsv/vscode-javascript-standard'

" Syntax
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'ghifarit53/tokyonight-vim'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Misc
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'moll/vim-bbye'

call plug#end()

set syntax
set number relativenumber
set expandtab
set inccommand=split
set cindent
set smartcase
set cursorline
set title
set hidden
set splitbelow
set splitright
set textwidth=120
set shiftwidth=2
set fillchars+=vert:\
set termguicolors
set formatoptions=aw2tq
set undofile
set fcs=eob:\ 

let g:tokyonight_style = 'storm'
let g:tokyonight_enable_italic = 1

colorscheme tokyonight
hi Normal guibg=none
hi EndOfBuffer guibg=none
hi SignColumn guibg=none
hi GitGutterAdd guibg=none
hi GitGutterChange guibg=none
hi GitGutterText guibg=none
hi GitGutterDelete guibg=none
hi ScrollView guibg=#777777

" Neovim 
let mapleader = ','

" Syntax
let g:rainbow_active = 1
let g:indentLine_conceallevel = 0

" Convenience
let g:indentLine_char_list = ['┊']
let g:scrollview_winblend = 55
let g:sneak#label = 1
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'markdown' : 1,
      \ 'javascriptreact' : 1,
      \ 'typescriptreact' : 1
      \}

" Tools
let g:python3_host_prog = expand('/Users/alexdiaz/.pyenv/versions/3.8.6/bin/python')
let g:vimtex_view_method = 'skim'
let g:rooter_silent_chdir = 1

" Project management
let g:fern#renderer = "nerdfont"

" LSP
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-stylelint',
      \ 'coc-tsserver',
      \ 'coc-emmet',
      \ 'coc-vimlsp', 
      \ 'coc-prettier', 
      \ 'coc-json', 
      \ 'coc-eslint',
      \ 'coc-pyright',
      \ 'coc-vimtex'
      \]

" Functions
function! FindFiles()
  let git_dir = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
  if git_dir != ''
    execute 'GFiles' git_dir
  else
    execute 'Files'
  endif
endfunction

" Movement
nnoremap <silent><Leader>w <Plug>CamelCaseMotion_w
nnoremap <silent><Leader>b <Plug>CamelCaseMotion_b
nnoremap <silent><Leader>e <Plug>CamelCaseMotion_e

" Buffer management
nnoremap <silent>gb :bnext<CR>
nnoremap <silent>gB :bprev<CR>
tnoremap <Esc> <C-\><C-n>

" Project management
nnoremap <silent><Leader>e :Fern . -drawer -reveal=% -toggle <CR>

" Tools
nnoremap <silent><C-P> :exec FindFiles()<CR>
nnoremap <silent><Leader>m :FZFMru<CR>
nnoremap <silent><Leader>l :Lines<CR>

augroup Setup
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd User VimtexEventInitPost VimtexCompile
augroup END

" Lua
lua <<EOF
require'colorizer'.setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  },
}
EOF

" Imports
source ~/.config/nvim/statusline.vim
source ~/.config/nvim/coc.vim

