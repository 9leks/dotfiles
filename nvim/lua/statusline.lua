if vim.g.vscode then
    return
end

local M = {}

local function diagnostics()
    local levels = {
        err = { 'ERROR', '' },
        warn = { 'WARN', '' },
        hint = { 'HINT', '' },
        info = { 'INFO', '' }
    }

    local res = {}
    for key, data in pairs(levels) do
        local level, icon = unpack(data)
        local count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity[level] })
        res[key] = count > 0 and string.format('%s %s  ', count, icon) or nil
    end

    return res['err'], res['warn'], res['hint'], res['info']
end

local function filetype()
    return vim.bo.filetype:lower()
end

local function position()
    return '%l:%v'
end

function M.active()
    local err, warn, hint, info = diagnostics()

    return table.concat {
        '%#NonText# ',
        vim.b.branch and string.format('%s ', vim.b.branch) or '',
        string.format('%s %s', filetype(), position()),
        '%#DiagnosticError#', err or '',
        '%#DiagnosticWarn#', warn or '',
        '%#DiagnosticHint#', hint or '',
        '%#DiagnosticInfo#', info or '',
    }
end

function M.tree()
    return '%#NonText#' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
end

return M
