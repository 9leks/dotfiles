if vim.g.vscode then
    return
end

vim.g.vimtex_compiler_latexmk = {
    callback = 1,
    continuous = 1,
    executable = 'latexmk',
    options = { '--verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode' }
}

vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_syntax_conceal_disable = true

vim.g.vimtex_toc_config = {
    split_pos   = ':vert :botright',
    split_width = 50,
    layers      = { 'content' },
    fold_enable = 1,
    show_help   = 0,
}

keymap({ 'n', 'i' }, '<M-b>', '<Cmd>VimtexCompileSS<CR>')
