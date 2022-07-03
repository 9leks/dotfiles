local gitsigns = import 'gitsigns'

if vim.g.vscode or not gitsigns then
    return
end

gitsigns.setup {
    signs = { changedelete = { text = '～' } },
    on_attach = function(bufnr)
        local opts = { buffer = bufnr }

        keymap({ 'n', 'v' }, '<Leader>gs', ':Gitsigns stage_hunk<CR>', opts)
        keymap({ 'n', 'v' }, '<Leader>gr', ':Gitsigns reset_hunk<CR>', opts)
        keymap({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', opts)
        keymap('n', '<Leader>g?', gitsigns.preview_hunk, opts)
        keymap('n', '<Leader>gt', gitsigns.toggle_signs, opts)
        keymap('n', '<Leader>gp', gitsigns.prev_hunk, opts)
        keymap('n', '<Leader>gn', gitsigns.next_hunk, opts)
        keymap('n', '<Leader>gd', gitsigns.diffthis, opts)
    end
}
