local autosession = import 'auto-session'

if not autosession then
    return
end

autosession.setup {
    auto_session_enabled = not vim.g.vscode,
    log_level = 'error',
}

vim.o.sessionoptions = 'buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'
