local custom_highlights = {}

function _G.import(package)
    local ok, plugin = pcall(require, package)

    if not ok then
        print('[error] package', package)
        return nil
    end

    return plugin
end

function _G.read_file(path, callback)
    local file = io.open(path)

    if not file then
        print('[error] file', path)
        return
    end

    callback(file:read '*all':sub(1, -2))
    file:close()
end

function _G.colorscheme(scheme)
    vim.o.background = 'dark'
    local color = scheme

    if color == 'rose-pine-dawn' then
        color = 'rose-pine'
        vim.o.background = 'light'
    end

    vim.cmd('colorscheme ' .. color)

    for name, val_or_fn in pairs(custom_highlights) do
        highlight(name, val_or_fn)
    end
end

function _G.highlight(name, val_or_fn)
    if val_or_fn then
        custom_highlights[name] = val_or_fn
        local val = type(val_or_fn) == 'function' and val_or_fn() or val_or_fn or {}
        vim.api.nvim_set_hl(0, name, val)
    else
        local ok, hl = pcall(vim.api.nvim_get_hl_by_name, name, true)

        if not ok then
            print('[error] highlight', name)
            return
        end

        local bg = hl.background and '#' .. bit.tohex(hl.background, 6) or 'none'
        local fg = hl.foreground and '#' .. bit.tohex(hl.foreground, 6) or 'none'
        return { bg = bg, fg = fg }
    end
end

function _G.keymap(mode, from, to, opts)
    opts = opts or {}
    local default = { silent = true }
    vim.keymap.set(mode, from, to, table.extend(default, opts))
end

function _G.autocmd(event, opts)
    opts = opts or {}
    vim.api.nvim_create_autocmd(event, opts)
end

function table.extend(table, by)
    return vim.tbl_extend('force', table, by)
end

function string:split_by(delim)
    local from = 1
    local result = {}
    local delim_from, delim_to = string.find(self, delim, from)

    while delim_from do
        table.insert(result, string.sub(self, from, delim_from - 1))
        from = delim_to + 1
        delim_from, delim_to = string.find(self, delim, from)
    end

    table.insert(result, string.sub(self, from))
    return result
end
