autocmd('BufReadPost', {
    callback = function()
        if vim.fn.line '\'"' >= 1 and vim.fn.line '\'"' <= vim.fn.line '$' and vim.ft ~= 'commit' then
            vim.cmd 'normal! g`"'
        end
    end
})

autocmd('CursorMoved', {
    callback = function()
        vim.api.nvim_echo({ { '' }, { '' } }, false, {})
    end
})

autocmd('BufWinEnter', {
    callback = function()
        local branch = vim.fn.system 'git branch --show-current 2> /dev/null | tr -d \'\n\''
        vim.b.branch = branch ~= '' and ' ' .. branch or ''

        if vim.bo.filetype ~= 'NvimTree' then
            vim.opt_local.winbar = '  %f'
            vim.opt_local.statusline = '%!v:lua.require(\'statusline\').active()'
        else
            vim.opt_local.winbar = ''
            vim.opt_local.statusline = '%!v:lua.require(\'statusline\').tree()'
        end
    end
})
