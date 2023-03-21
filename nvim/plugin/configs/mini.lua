local mini_cursorword = import 'mini.cursorword'
local mini_bufremove = import 'mini.bufremove'

if vim.g.vscode or not mini_cursorword or not mini_bufremove then
    return
end

mini_cursorword.setup {}

vim.keymap.set('n', '<M-w>', function() mini_bufremove.delete(0) end)

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'NvimTree',
    callback = function()
        vim.b.minicursorword_disable = true
    end
})

if vim.o.background == 'dark' then
    vim.api.nvim_set_hl(0, 'MiniCursorword', { bg = '#3C3B4A' })
else
    vim.api.nvim_set_hl(0, 'MiniCursorword', { bg = '#dddddd' })
end
