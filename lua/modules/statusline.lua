vim.cmd [[
set noshowmode
set laststatus=2
set noruler

function! Status()
  if mode() == 'n'
    return " NORMAL "
  elseif mode() == 'i'
    return " INSERT "
  elseif mode() == 'R'
    return " REPLACE "
  elseif mode() ==# 'v'
    return " VISUAL "
  elseif mode() ==# 'V'
    return " VISUAL "
  elseif mode() ==# ''
    return " VISUAL "
  elseif mode() ==# 'c'
    return " COMMAND "
  elseif mode() ==# 't'
    return " TERMINAL "
  elseif mode() == 'v' || mode() == 'V' || mode() == '^V' || mode() == 's' || mode() == 'S' || mode() == '^S'
    return " VISUAL "
  endif
endfunction

highlight StatusLine guibg=#282828 guifg=#dddddd
highlight Warning guifg=#f8981c guibg=#282828
highlight Error guifg=#c41111 guibg=#282828

set statusline=
set statusline+=\ %{Status()}
set statusline+=%{expand('%:t')}
set statusline+=%{&mod==1?'\ +\ ':'\ '}

set statusline+=%{FugitiveHead()!=''?'\ ':''}
set statusline+=%{FugitiveHead()!=''?FugitiveHead():''}

set statusline+=%=

function! Diagnostics() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  let errors = get(info, 'error', 0)
  let warnings = get(info, 'warning', 0)
  return {'errors': errors, 'warnings': warnings}
endfunction

set statusline+=%#Error#%{Diagnostics().errors?Diagnostics().errors:''}
set statusline+=%{Diagnostics().errors?'\ ●\ ':''}%*
set statusline+=%#Warning#%{Diagnostics().warnings?Diagnostics().warnings:''}
set statusline+=%{Diagnostics().warnings?'\ ●\ ':''}%*

set statusline+=%{tolower(&filetype)}
set statusline+=\ %l:%c\ 

set statusline+=%{getcwd()}

]]
