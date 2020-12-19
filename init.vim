let g:polyglot_disabled = ['tex']

call plug#begin()
" Buffer handling
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'
Plug 'ap/vim-buftabline', {'frozen': 1}

" Tools
Plug 'justinmk/vim-sneak'
Plug 'lervag/vimtex'
Plug 'brennier/quicktex'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-rooter'
Plug 'aymericbeaumet/vim-symlink'
Plug 'sheerun/vim-polyglot'

" Convenience
Plug 'luochen1990/rainbow'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'romainl/vim-cool'
Plug 'valloric/MatchTagAlways'
Plug 'AndrewRadev/tagalong.vim'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jmsv/vscode-javascript-standard'

" Syntax
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sonph/onehalf', {'rtp': 'vim/'}

call plug#end()

set syntax
set number relativenumber
set expandtab
set inccommand=split
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

" Syntax
colorscheme onehalfdark
" hi EndOfBuffer guibg=none
" hi Normal guibg=none
" hi SignColumn guibg=none
" hi GitGutterAdd guibg=none
" hi GitGutterChange guibg=none
" hi GitGutterText guibg=none
" hi GitGutterDelete guibg=none
" hi ScrollView guibg=#777777

" Neovim 
let mapleader = ','

" Syntax
let g:rainbow_active = 1

" Convenience
let g:sneak#label = 1
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'markdown' : 1,
      \ 'javascriptreact' : 1,
      \ 'typescriptreact' : 1
      \}

" Tools
let g:python3_host_prog = expand('/Users/alexdiaz/.pyenv/versions/3.8.6/bin/python')
let g:rooter_silent_chdir = 1
let g:vimtex_view_method = 'skim'
let g:vimtex_compiler_latexmk = { 'build_dir' : './bin' }

" LSP
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-lists',
      \ 'coc-pairs',
      \ 'coc-stylelint',
      \ 'coc-tsserver',
      \ 'coc-emmet',
      \ 'coc-vimlsp', 
      \ 'coc-prettier', 
      \ 'coc-json', 
      \ 'coc-eslint',
      \ 'coc-pyright',
      \ 'coc-vimtex',
      \ 'coc-explorer'
      \]

" Functions
function! s:DisableFileExplorer()
    au! FileExplorer
endfunction

function! s:OpenDirHere(dir)
    if isdirectory(a:dir)
        exec 'silent CocCommand explorer --current-buffer' . a:dir
    endif
endfunction

function! FindFiles()
  let git_dir = system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
  if git_dir != ''
    execute 'GFiles' git_dir
  else
    execute 'Files'
  endif
endfunction

" Buffer management
nnoremap <silent>gb :bnext<CR>
nnoremap <silent>gB :bprev<CR>
tnoremap <Esc> <C-\><C-n>
let g:buftabline_numbers=1
let g:buftabline_indicators=1
 
" Project management
nnoremap <Leader>e :CocCommand explorer --position right --sources=file+<CR>
set mouse=a

" Tools
nnoremap <silent><C-P> :exec FindFiles()<CR>
nnoremap <silent><Leader>m :FZFMru<CR>
nnoremap <silent><Leader>l :Lines<CR>
nnoremap <silent><Leader>g :CocList grep<CR>

" Autocommands
augroup CocExplorer
  autocmd VimEnter * call <SID>DisableFileExplorer()
  autocmd BufEnter * call <SID>OpenDirHere(expand('<amatch>'))
augroup end

augroup Vimtex
  autocmd User VimtexEventInitPost VimtexCompile
augroup end

augroup Startup
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

" Lua
lua <<EOF
require'colorizer'.setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = { enable = true },
  indent = { enable = true },
}

EOF

source ~/.config/nvim/statusline.vim
source ~/.config/nvim/coc.vim
