local comment = import 'Comment'

if vim.g.vscode then
    vim.keymap.set({ 'x', 'o', 'n' }, 'gc', '<Plug>VSCodeCommentary', { remap = true })
    vim.keymap.set('n', 'gcc', '<Plug>VSCodeCommentaryLine', { remap = true })
    return
end

if not comment then
    return
end

comment.setup {}
