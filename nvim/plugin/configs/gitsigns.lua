local gitsigns = import 'gitsigns'

if vim.g.vscode or not gitsigns then
    return
end

gitsigns.setup {
    signs = {
        changedelete = { hl = 'GitSignsChange', text = '～', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    },
}

vim.keymap.set('n', '<leader><leader>gt', gitsigns.toggle_signs, {})
vim.keymap.set('n', '<leader><leader>gp', gitsigns.prev_hunk, {})
vim.keymap.set('n', '<leader><leader>gn', gitsigns.next_hunk, {})
vim.keymap.set('n', '<leader><leader>gr', gitsigns.reset_hunk, {})
vim.keymap.set('n', '<leader><leader>gd', gitsigns.diffthis, {})
