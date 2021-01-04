set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

augroup CocSetup
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

inoremap <silent><expr> <c-space> coc#refresh()

nmap <leader>rn <Plug>(coc-rename)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent><Leader>c :call CocAction('pickColor')<CR>
nnoremap <silent><Esc> :call coc#float#close_all()<CR>
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Organize :call CocAction('runCommand', 'editor.action.organizeImport')

nnoremap <silent><Leader>f :Format<CR>
nnoremap <silent><Leader>o :Organize<CR>

hi CocErrorVirtualText guifg=#c41111
