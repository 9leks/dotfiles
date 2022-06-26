local notify = import 'notify'

if vim.g.vscode or not notify then
    return
end

vim.notify = notify

highlight('NotifyTRACEIcon', { link = 'Normal' })
highlight('NotifyTRACEBorder', { link = 'DiagnosticInfo' })

highlight('NotifyINFOIcon', { link = 'Normal' })
highlight('NotifyINFOBorder', { link = 'DiagnosticInfo' })

highlight('NotifyDEBUGIcon', { link = 'Normal' })
highlight('NotifyDEBUGBorder', { link = 'DiagnosticHint' })

highlight('NotifyWARNIcon', { link = 'Normal' })
highlight('NotifyWARNBorder', { link = 'DiagnosticWarn' })

highlight('NotifyERRORIcon', { link = 'Normal' })
highlight('NotifyERRORBorder', { link = 'DiagnosticError' })
