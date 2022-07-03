autocmd('CursorMoved', {
    callback = function()
        print ' '
    end
})

autocmd('BufWinEnter', {
    callback = function()
        local branch = vim.fn.system [[git branch --show-current 2> /dev/null | tr -d '\n']]
        vim.b.branch = branch ~= '' and ' ' .. branch or ''

        if vim.bo.filetype ~= 'NvimTree' then
            vim.opt_local.winbar = '   %t'
            vim.opt_local.statusline = [[%!v:lua.require'statusline'.active()]]
        else
            vim.opt_local.winbar = ''
            vim.opt_local.statusline = [[%!v:lua.require'statusline'.tree()]]
        end
    end
})
