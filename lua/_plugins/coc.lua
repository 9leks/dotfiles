vim.g.coc_global_extensions = {
	'coc-snippets',
	'coc-pairs',
	'coc-stylelintplus',
	'coc-tsserver',
	'coc-emmet',
	'coc-prettier', 
	'coc-json', 
	'coc-eslint',
	'coc-vimtex',
	'coc-highlight',
	'coc-styled-components'
}

vim.o.updatetime = 300
vim.o.shortmess = vim.o.shortmess .. 'c'

local opts = {expr = true, silent = true}

vim.cmd [[
function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
]]

vim.api.nvim_set_keymap('n', 'K', [[:call CocActionAsync('doHover')<CR>]], {silent = true})
vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : CheckBackSpace() ? "\<TAB>" : coc#refresh()]], opts)
vim.api.nvim_set_keymap('i', '<CR>', [[pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]], opts)
vim.api.nvim_set_keymap('i', '<C-Space>', 'coc#refresh', opts)

vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})
vim.api.nvim_set_keymap('n', 'gd', 'Plug>(coc-definition)', {silent = true})
vim.api.nvim_set_keymap('n', 'gy', 'Plug>(coc-type-definition)', {silent = true})
vim.api.nvim_set_keymap('n', 'gi', 'Plug>(coc-implementation)', {silent = true})
vim.api.nvim_set_keymap('n', 'gr', 'Plug>(coc-references)', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>rn', '<Plug>(coc-rename)', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>e', ':<C-u>CocList diagnostics<CR>', {silent = true, nowait = true})

vim.cmd [[command! -nargs=0 Format :call CocAction('format')]]
vim.cmd [[command! -nargs=0 Organize :call CocAction('runCommand', 'editor.action.organizeImport')]]
vim.api.nvim_set_keymap('n', '<Space>f', ':Format<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<Space>o', ':Organize<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<Esc>', ':call coc#float#close_all()<CR>', {silent = true})

vim.cmd [[hi CocErrorVirtualText guifg=#c41111]]
