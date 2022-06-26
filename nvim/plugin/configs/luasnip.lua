local snippets = import 'luasnip'

if vim.g.vscode or not snippets then
    return
end

require 'luasnip.loaders.from_vscode'.lazy_load()
