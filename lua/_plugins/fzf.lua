local opts = {silent = true, noremap = true}

vim.api.nvim_set_keymap('n', '<C-P>', ':GitFiles<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>p', ':Files<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>l', ':Lines<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>m', ':History<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>b', ':Buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>g', ':Rg<CR>', opts)

