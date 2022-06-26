local zen = import 'zen-mode'

if vim.g.vscode or not zen then
    return
end

zen.setup {
    on_open = function(_) vim.cmd ':Limelight' end,
    on_close = function() vim.cmd ':Limelight!' end,
    window = {
        backdrop = 1,
        width = 130,
        options = {
            cursorline = false,
        },
    },
    plugins = {
        tmux = { enabled = true },
        gitsigns = { enabled = true },
    },
}

keymap('n', '<leader>f', zen.toggle)
