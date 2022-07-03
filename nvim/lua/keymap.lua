vim.g.mapleader = '\\'
vim.g.leader = '\\'

keymap({ 'n', 'x' }, '[[', '{j')
keymap({ 'n', 'x' }, ']]', '}ge')
keymap('n', '<M-q>', 'gwap')
keymap('i', '<M-q>', 'gwapa')
keymap({ 'n', 'i' }, '<C-s>', '<Cmd>silent write<CR>')
keymap('i', 'jj', '<Esc>')
keymap('n', 'h:', 'q:')
keymap('n', 'q:', '<nop>')
keymap({ 'n', 'x' }, '<Leader>d', '"_d')
keymap('x', 'p', '"_dP')
keymap('n', 'n', 'nzz')
keymap('n', 'N', 'Nzz')
