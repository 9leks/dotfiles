if vim.g.vscode then
    return
end

local M = {}

local function diagnostics()
    local levels = { err = { 'ERROR', '' }, warn = { 'WARN', '' }, hint = { 'HINT', '' }, info = { 'INFO', '' } }
    local res = {}

    for key, data in pairs(levels) do
        local level, icon = unpack(data)
        local count = vim.tbl_count(vim.diagnostic.get(0, { severity = vim.diagnostic.severity[level] }))
        res[key] = count > 0 and string.format('%s %s  ', count, icon) or nil
    end

    return res['err'], res['warn'], res['hint'], res['info']
end

local function filetype()
    return vim.bo.filetype:lower()
end

local function position()
    return '%l:%c'
end

-- local function tmux()
--     local active = vim.fn.system 'tmux display-message -p \'#I\'':sub(1, -2)
--     local windows = vim.fn.system 'tmux list-windows -F \'#I #W\'':sub(1, -2):split_by '\n'

--     local result = {}
--     for _, window in ipairs(windows) do
--         local index, name = unpack(window:split_by ' ')
--         table.insert(result, (index == active and '%#TmuxWindow#' or '%#TmuxWindowNC#') .. name)
--     end

--     return #result > 0 and table.concat(result, ' ') or ''
-- end

function M.active()
    local err, warn, hint, info = diagnostics()

    return table.concat {
        '%#DiagnosticError#', err or '',
        '%#DiagnosticWarn#', warn or '',
        '%#DiagnosticHint#', hint or '',
        '%#DiagnosticInfo#', info or '',
        '%=%#NonText#',
        vim.b.branch and vim.b.branch .. ' ' or '',
        string.format('%s  %s ', position(), filetype()),
    }
end

function M.tree()
    return '%#NonText#' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
end

return M
