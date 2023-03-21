local ts = import 'nvim-treesitter.configs'

if vim.g.vscode or not ts then
    return
end

ts.setup {
    highlight = {
        enable = true
    },
    matchup = {
        enable = true
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = 5000,
        colors = {
            '#b48ead',
            '#88c0d0',
            '#ebcb8b',
            '#d08770',
            '#bf616a',
            '#5e81ac',
            '#a3be8c',
        }
    },
}
