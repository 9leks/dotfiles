local telescope = import 'telescope'
local builtin = import 'telescope.builtin'

if vim.g.vscode or not telescope or not builtin then
    return
end

telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        }
    }
}

local defaults = {
    previewer = false,
    prompt_title = false,
    results_title = false,
    prompt_prefix = '  ',
    selection_caret = '  ',
    sorting_strategy = 'ascending',
    file_ignore_patterns = { 'packer_compiled' },
    layout_config = { width = 0.5, height = 0.6, prompt_position = 'top' },
    get_status_text = function(picker)
        local xx = (picker.stats.processed or 0) - (picker.stats.filtered or 0)
        local yy = picker.stats.processed or 0

        if xx == 0 and yy == 0 then
            return ''
        end

        local ww = #(picker:get_multi_selection())
        return ww == 0 and string.format('%s / %s  ', xx, yy) or string.format('%s / %s / %s  ', ww, xx, yy)
    end,
}

highlight('TelescopeBorder', { link = 'WindowSeparator' })

keymap('n', ',tn', telescope.extensions.notify.notify)
keymap('n', ',th', function() builtin.oldfiles(defaults) end)
keymap('n', ',tg', function() builtin.git_files(defaults) end)
keymap('n', ',tr', function() builtin.live_grep(defaults) end)
keymap('n', ',tf', function() builtin.find_files(defaults) end)

keymap('n', ',tq', function() builtin.diagnostics(table.extend(defaults, {
        layout_config = { width = 0.75, height = 0.6, prompt_position = 'top' },
    }))
end)

telescope.load_extension('fzf')
