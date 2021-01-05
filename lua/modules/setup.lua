vim.cmd 'filetype plugin on'

vimp.tnoremap({'silent'}, '<Esc>', '<C-\\><C-n>')
vimp.nnoremap({'silent'}, 'gB', ':bnext<CR>')
vimp.nnoremap({'silent'}, 'gb', ':bprev<CR>')

vim.cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
vim.cmd [[au CmdlineLeave : echo '']]

vim.cmd [[
  cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
  cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
  cnoreabbrev <expr> WQ ((getcmdtype() is# ':' && getcmdline() is# 'WQ')?('wq'):('WQ'))
  cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))
]]
