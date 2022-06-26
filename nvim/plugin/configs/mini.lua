local mini_cursorword = import 'mini.cursorword'
local mini_bufremove = import 'mini.bufremove'

if vim.g.vscode or not mini_cursorword or not mini_bufremove then
    return
end

mini_cursorword.setup {}

highlight('MiniCursorword', function()
    local cursorword = vim.o.background == 'dark' and '#3c3b4a' or '#dddddd'
    return { bg = cursorword }
end)

keymap('n', '<M-w>', function() mini_bufremove.delete(0) end)

autocmd('FileType', {
    pattern = 'NvimTree',
    callback = function()
        vim.b.minicursorword_disable = true
    end
})
