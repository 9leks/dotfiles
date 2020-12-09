set noshowmode
set noruler

function! CheckFT(filetype)
  if a:filetype == ''
    return '-'
  else
    return tolower(a:filetype)
  endif
endfunction

function! StatusLine(mode)
  let left=""
  let right=""

  let statusline=""
  if a:mode == 'n'
    let statusline .= " NORMAL "
  elseif a:mode == 'i'
    let statusline .= " INSERT "
  elseif a:mode == 'R'
    let statusline .= " REPLACE "
  elseif a:mode ==# 'v'
    let statusline .= " VISUAL "
  elseif a:mode ==# 'V'
    let statusline .= " VISUAL "
  elseif a:mode ==# ''
    let statusline .= " VISUAL "
  elseif a:mode ==# 'c'
    let statusline=""
    let statusline .= " COMMAND "
  elseif a:mode ==# 't'
    let statusline .= " TERMINAL "
  elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V' || a:mode == 's' || a:mode == 'S' || a:mode == '^S'
    let statusline .= " VISUAL "
  endif
  if &mod == 1
	let statusline .= " %.20f + "
  else
	let statusline .= " %.20f "
  endif
  if FugitiveHead() != ''
    let statusline .= " \uE0A0 %{FugitiveHead()} "
  endif
  let statusline .= "%="
  let statusline .= "%{CheckFT(&filetype)} "
  let statusline .= " %-8.(line %l, column %c%) "
  return statusline
endfunction

highlight StatusLine guibg=#292929 guifg=white

set laststatus=2
set statusline=%!StatusLine(mode())

