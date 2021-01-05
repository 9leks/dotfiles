require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.texlab.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.jsonls.setup{on_attach=require'completion'.on_attach}

local system_name
if vim.fn.has('mac') == 1 then
  system_name = 'macOS'
elseif vim.fn.has('unix') == 1 then
  system_name = 'Linux'
elseif vim.fn.has('win32') == 1 then
  system_name = 'Windows'
else
  print('Unsupported system for sumneko')
end

local sumneko_root_path = vim.fn.stdpath('cache') .. '/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/' .. system_name .. '/lua-language-server'

require'lspconfig'.sumneko_lua.setup {
  on_attach = require'completion'.on_attach,
  cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim', 'use', 'vimp'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}
