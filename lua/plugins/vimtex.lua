vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_compiler_latexmk = {build_dir = './bin'}
vim.cmd('au User VimtexEventInitPost VimtexCompile')
