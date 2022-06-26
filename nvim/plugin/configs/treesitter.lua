local treesitter = import 'nvim-treesitter.configs'

if vim.g.vscode or not treesitter then
    return
end

treesitter.setup {
    ensure_installed = 'all',
    ignore_install = { 'phpdoc', 'tree-sitter-phpdoc' },
    highlight = { enable = true },
    select = {
        enable = true,
        lookahead = true,
        keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 5000,
        colors = { '#b48ead', '#88c0d0', '#ebcb8b', '#d08770', '#bf616a', '#5e81ac', '#a3be8c' }
    }
}
