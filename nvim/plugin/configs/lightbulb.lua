local lightbulb = import 'nvim-lightbulb'

if vim.g.vscode or not lightbulb then
    return
end

lightbulb.setup {
    autocmd = { enabled = true }
}
