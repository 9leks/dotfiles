local lspconfig = import 'lspconfig'

local ufo = import 'ufo'
local fidget = import 'fidget'
local luadev = import 'lua-dev'
local cmp = import 'cmp_nvim_lsp'
local rust_tools = import 'rust-tools'

if vim.g.vscode or not lspconfig or not cmp then
    return
end

if fidget then
    fidget.setup {}
end

for type, icon in pairs { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' } do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local lsp = vim.lsp
local diagnostic = vim.diagnostic
local capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

if ufo then
    capabilities.textDocument.foldingRange = {
        lineFoldingOnly = true,
        dynamicRegistration = false,
    }

    ufo.setup {}
end

keymap('n', '[d', diagnostic.goto_prev)
keymap('n', ']d', diagnostic.goto_next)
keymap('n', '<space>e', diagnostic.open_float)
keymap('n', '<space>q', diagnostic.setloclist)

local on_attach = function(_, buf)
    keymap('n', 'K', lsp.buf.hover, { buffer = buf })
    keymap('n', 'gd', lsp.buf.definition, { buffer = buf })
    keymap('n', 'gr', lsp.buf.references, { buffer = buf })
    keymap('n', 'gD', lsp.buf.declaration, { buffer = buf })
    keymap('n', '<space>rn', lsp.buf.rename, { buffer = buf })
    keymap('n', 'gi', lsp.buf.implementation, { buffer = buf })
    keymap('n', '<C-k>', lsp.buf.signature_help, { buffer = buf })
    keymap('n', '<space>ca', lsp.buf.code_action, { buffer = buf })
    keymap('n', '<space>D', lsp.buf.type_definition, { buffer = buf })
    keymap('n', '<space>wa', lsp.buf.add_workspace_folder, { buffer = buf })
    keymap('n', '<space>wr', lsp.buf.remove_workspace_folder, { buffer = buf })
    keymap('n', '<space>f', function() lsp.buf.format { async = true } end, { buffer = buf })
end

require 'fidget'.setup {}

if luadev then
    lspconfig.sumneko_lua.setup(luadev.setup {
        runtime_path = true,
        lspconfig = {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
        }
    })
end

lspconfig.texlab.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.bashls.setup {
    filetypes = { 'sh', 'zsh' },
    on_attach = on_attach,
    capabilities = capabilities,
}

if rust_tools then
    rust_tools.setup {
        server = {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    }
end
