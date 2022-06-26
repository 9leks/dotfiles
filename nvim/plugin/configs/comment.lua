local comment = import 'Comment'

if vim.g.vscode then
    keymap({ 'x', 'o', 'n' }, 'gc', '<Plug>VSCodeCommentary', { remap = true })
    keymap('n', 'gcc', '<Plug>VSCodeCommentaryLine', { remap = true })
    return
end

if not comment then
    return
end

comment.setup {
    ignore = '^$'
}
