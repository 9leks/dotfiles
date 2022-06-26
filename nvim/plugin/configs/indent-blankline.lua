local indent_blankline = import 'indent_blankline'

if vim.g.vscode or not indent_blankline then
    return
end

indent_blankline.setup {
    show_current_context = true,
    show_first_indent_level = false,
}

highlight('IndentBlankLineChar', { link = 'LineNr' })
highlight('IndentBlanklineContextChar', { link = 'Special' })
