local rooter = import 'nvim-rooter'

if vim.g.vscode or not rooter then
    return
end

rooter.setup {
    update_cwd = true,
    update_focused_file = { enable = true, update_cwd = true },
}
