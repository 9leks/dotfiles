local neodev = import 'neodev'
local lspconfig = import 'lspconfig'
local cmp = import 'cmp_nvim_lsp'

if vim.g.vscode or not lspconfig or not cmp or not neodev then
    return
end

neodev.setup {}

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }

for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local lsp = vim.lsp
local diagnostic = vim.diagnostic
local capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.keymap.set('n', '<space>e', diagnostic.open_float, {})
vim.keymap.set('n', '[d', diagnostic.goto_prev, {})
vim.keymap.set('n', ']d', diagnostic.goto_next, {})
vim.keymap.set('n', '<space>q', diagnostic.setloclist, {})

local on_attach = function(_, buf)
    vim.keymap.set('n', 'gD', lsp.buf.declaration, { buffer = buf })
    vim.keymap.set('n', 'gd', lsp.buf.definition, { buffer = buf })
    vim.keymap.set('n', 'K', lsp.buf.hover, { buffer = buf })
    vim.keymap.set('n', 'gi', lsp.buf.implementation, { buffer = buf })
    vim.keymap.set('n', '<C-k>', lsp.buf.signature_help, { buffer = buf })
    vim.keymap.set('n', '<space>wa', lsp.buf.add_workspace_folder, { buffer = buf })
    vim.keymap.set('n', '<space>wr', lsp.buf.remove_workspace_folder, { buffer = buf })
    vim.keymap.set('n', '<space>D', lsp.buf.type_definition, { buffer = buf })
    vim.keymap.set('n', '<space>ca', lsp.buf.code_action, { buffer = buf })
    vim.keymap.set('n', 'gr', lsp.buf.references, { buffer = buf })
    vim.keymap.set('n', '<space>f', function() lsp.buf.format { async = true } end, { buffer = buf })
    vim.keymap.set('n', '<space>rn', lsp.buf.rename, { buffer = buf })
end

lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.kotlin_language_server.setup {
    on_attach = on_attach
}

lspconfig.tsserver.setup {
    on_attach = on_attach
}

lspconfig.bashls.setup {
    on_attach = on_attach,
    filetypes = { 'sh', 'zsh' }
}
