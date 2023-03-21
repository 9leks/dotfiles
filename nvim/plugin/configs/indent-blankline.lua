local indent_blankline = import 'indent_blankline'

if vim.g.vscode or not indent_blankline then
    return
end

indent_blankline.setup {
    show_first_indent_level = false,
    use_treesitter = true,
}

-- highlight('IndentBlanklineChar', { link = 'Keyword' })
