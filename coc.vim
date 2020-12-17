set cmdheight=2
set updatetime=300
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <Tab> pumvisible()
      \? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <Leader>rn <Plug>(coc-rename)

xnoremap if <Plug>(coc-funcobj-i)
onoremap if <Plug>(coc-funcobj-i)
xnoremap af <Plug>(coc-funcobj-a)
onoremap af <Plug>(coc-funcobj-a)
xnoremap ic <Plug>(coc-classobj-i)
onoremap ic <Plug>(coc-classobj-i)
xnoremap ac <Plug>(coc-classobj-a)
onoremap ac <Plug>(coc-classobj-a)

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Organize :call CocAction('runCommand', 'editor.action.organizeImport')
nnoremap <silent><Leader>f :Format<CR>
nnoremap <silent><Leader>o :Organize<CR>

nnoremap <silent><nowait> <Space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <Space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <Space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <Space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <Space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <Space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <Space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <Space>p  :<C-u>CocListResume<CR>

nnoremap <silent><Esc> :call coc#float#close_all()<CR>

hi CocErrorVirtualText guifg=#c41111

augroup CocSetup
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd FileType css,scss nnoremap <buffer> <silent><Leader>f :Format<CR> <Bar> :!npx stylelint --fix %:p<CR>
augroup end
