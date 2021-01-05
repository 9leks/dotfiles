vim.cmd('source ~/.config/nvim/statusline.vim')
vim.cmd('filetype plugin on')
vim.cmd('hi VertSplit gui=none guibg=none guifg=#222222')
vim.cmd('hi SignColumn guibg=none')

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)
vim.api.nvim_set_keymap('n', 'gB', ':bnext<CR>', opts)
vim.api.nvim_set_keymap('n', 'gb', ':bprev<CR>', opts)

vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])
vim.cmd([[au CmdlineLeave : echo '']])
