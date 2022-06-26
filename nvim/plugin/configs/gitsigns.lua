local gitsigns = import 'gitsigns'

if vim.g.vscode or not gitsigns then
    return
end

gitsigns.setup {
    signs = { changedelete = { text = '～' } },
}

keymap('n', '<leader><leader>gt', gitsigns.toggle_signs)
keymap('n', '<leader><leader>gp', gitsigns.prev_hunk)
keymap('n', '<leader><leader>gn', gitsigns.next_hunk)
keymap('n', '<leader><leader>gr', gitsigns.reset_hunk)
keymap('n', '<leader><leader>gd', gitsigns.diffthis)
