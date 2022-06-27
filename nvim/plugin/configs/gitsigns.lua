local gitsigns = import 'gitsigns'

if vim.g.vscode or not gitsigns then
    return require 'gitsigns'.select_hunk()
end

gitsigns.setup {
    signs = { changedelete = { text = '～' } },
    on_attach = function(bufnr)
        local opts = { buffer = bufnr }

        keymap({ 'n', 'v' }, '<leader>gs', ':Gitsigns stage_hunk<CR>', opts)
        keymap({ 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<CR>')
        keymap({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

        keymap('n', '<leader><leader>g?', gitsigns.preview_hunk, opts)
        keymap('n', '<leader><leader>gt', gitsigns.toggle_signs, opts)
        keymap('n', '<leader><leader>gp', gitsigns.prev_hunk, opts)
        keymap('n', '<leader><leader>gn', gitsigns.next_hunk, opts)
        keymap('n', '<leader><leader>gd', gitsigns.diffthis, opts)
    end
}
