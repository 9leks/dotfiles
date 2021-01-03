let g:polyglot_disabled = ['tex']

call plug#begin()

" Buffer handling
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'

if !exists('g:uivonim')
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'itchyny/lightline.vim'
endif

" Tools
Plug 'justinmk/vim-sneak'
Plug 'lervag/vimtex'
Plug 'brennier/quicktex'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'

" Misc
Plug 'airblade/vim-rooter'
Plug 'aymericbeaumet/vim-symlink'

" Convenience
Plug 'luochen1990/rainbow'
Plug 'romainl/vim-cool'
Plug 'valloric/MatchTagAlways'
Plug 'AndrewRadev/tagalong.vim'
Plug 'tpope/vim-abolish'
Plug 'michaeljsmith/vim-indent-object'
Plug 'Spenny1068/ciBracket'
Plug 'Yggdroot/indentLine'
Plug 'yuttie/comfortable-motion.vim'

" LSP
if !exists('g:uivonim')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jmsv/vscode-javascript-standard'
else
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
endif

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'pineapplegiant/spaceduck'
call plug#end()

set syntax
set number relativenumber
set expandtab
set inccommand=split
set smartcase
set signcolumn=yes
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
colorscheme spaceduck
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:lightline#bufferline#show_number  = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed      = '[No Name]'

set showtabline=2
let g:lightline                  = {}
let g:lightline.colorscheme      = 'spaceduck'
let g:lightline.tabline          = {'left': [['buffers']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

if !exists('g:uivonim')
  hi EndOfBuffer guibg=none
  hi Normal guibg=none
  hi LineNr guibg=none
  hi SignColumn guibg=none
  hi DiffAdd guibg=none
  hi DiffChange guibg=none
  hi DiffDelete guibg=none
  hi BufTabLineFill guibg=none
  hi BufTabLineCurrent guibg=#222222
  hi BufTabLineActive guibg=none
  hi BufTabLineHidden guibg=none
endif

if exists('g:uivonim')
  set linespace=10
  set guifont=Roboto\ Mono\ For\ Powerline:h17
endif

" Neovim
let mapleader = ','

" Syntax
let g:rainbow_active = 1

" Convenience
let g:indentLine_char_list = ['│']
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
if !exists('g:uivonim')
  let g:coc_global_extensions = [
        \ 'coc-explorer',
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
        \ 'coc-vimtex',
        \ 'coc-highlight',
        \ 'coc-styled-components'
        \]
else
  augroup Completion
    autocmd BufEnter * lua require'completion'.on_attach()
  augroup end

  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  set completeopt=menuone,noinsert,noselect
  set shortmess+=c
endif

" Buffer management
nnoremap <silent><M-d> :bprev<CR>
nnoremap <silent><M-f> :bnext<CR>
let g:buftabline_numbers=1
let g:buftabline_indicators=1
tnoremap <Esc> <C-\><C-n>

" Tools
if !exists('g:uivonim')
  nnoremap <silent><C-P> :GitFiles<CR>
  nnoremap <silent><Leader>p :Files<CR>
  nnoremap <silent><Leader>l :Lines<CR>
  nnoremap <silent><Leader>m :History<CR>
  nnoremap <silent><Leader>b :Buffers<CR>
  nnoremap <silent><Leader>g :Rg<CR>
  nnoremap <silent><Leader>e :CocCommand explorer --position right --sources=file+<CR>
else
  nnoremap <silent><C-P> :Uivonim files<CR>
  nnoremap <silent><Leader>b :Uivonim buffers<CR>
  nnoremap <silent><Leader>g :Uivonim grep<CR>
  nnoremap <silent><Leader>m :History<CR>
endif

augroup Vimtex
  autocmd User VimtexEventInitPost VimtexCompile
augroup end

augroup Startup
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  autocmd CmdlineLeave : echo ''
augroup END

if !exists('g:uivonim')
  source ~/.config/nvim/coc.vim
endif

" Lua
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = { enable = true },
  indent = { enable = true },
  }

  if vim.g.uivonim == 1 then
    local lsp_callbacks = require'uivonim.lsp'.callbacks
    local lspconfig = require'lspconfig'

    lspconfig.tsserver.setup {
    handlers = lsp_callbacks;
    on_attach = require('completion').on_attach
    }
  end
EOF

