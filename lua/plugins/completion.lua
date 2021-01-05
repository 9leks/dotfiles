vimp.inoremap({'expr'}, '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
vimp.inoremap({'expr'}, '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
vimp.imap({'silent'}, '<CR>', '<Plug>(completion_trigger)')

vim.o.completeopt = 'menuone,noinsert'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.g.completion_enable_snippet = 'UltiSnips'
