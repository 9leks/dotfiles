vimp.nnoremap({'silent'}, '-', ':Dirvish<CR>')
vim.g.dirvish_mode = [[:silent keeppatterns g@\v/\.[^\/]+/?$@d _]]
vim.g.loaded_netrwPlugin = true

vim.cmd('command! -nargs=? -complete=dir Explore Dirvish <args>')
vim.cmd('command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>')
vim.cmd('command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>')
