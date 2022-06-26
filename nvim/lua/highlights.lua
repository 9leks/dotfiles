read_file('/tmp/theme', colorscheme)

highlight('WindowSeparator', function()
    local separator = vim.o.background == 'dark' and '#111111' or '#cecece'
    return { fg = separator }
end)

highlight('VertSplit', { link = 'WindowSeparator' })
highlight('StatusLine', { fg = highlight('Normal').bg })

highlight('TmuxWindow', { fg = 'Gray' })
highlight('TmuxWindowNC', { link = 'NonText' })

highlight('Winbar', { fg = highlight('NonText').fg })
highlight('WinbarNC', { fg = highlight('NonText').fg, italic = true })