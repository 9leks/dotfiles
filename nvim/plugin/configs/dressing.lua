local dressing = import 'dressing'

if vim.g.vscode or not dressing then
    return
end

dressing.setup {}
