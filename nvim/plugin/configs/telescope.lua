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
    get_status_text = function(self)
        local xx = (self.stats.processed or 0) - (self.stats.filtered or 0)
        local yy = self.stats.processed or 0

        if xx == 0 and yy == 0 then
            return ''
        end

        local ww = #(self:get_multi_selection())
        return ww == 0 and string.format('%s / %s  ', xx, yy) or string.format('%s / %s / %s  ', ww, xx, yy)
    end,
}

highlight('TelescopeBorder', { link = 'WindowSeparator' })

keymap('n', ',n', telescope.extensions.notify.notify)
keymap('n', ',h', function() builtin.oldfiles(defaults) end)
keymap('n', ',g', function() builtin.git_files(defaults) end)
keymap('n', ',r', function() builtin.live_grep(defaults) end)
keymap('n', ',f', function() builtin.find_files(defaults) end)

keymap('n', ',q', function() builtin.diagnostics(table.extend(defaults, {
        layout_config = { width = 0.75, height = 0.6, prompt_position = 'top' },
    }))
end)

telescope.load_extension('fzf')
