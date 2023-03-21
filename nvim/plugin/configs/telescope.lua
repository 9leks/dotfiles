local telescope = import 'telescope'
local builtin = import 'telescope.builtin'

if vim.g.vscode or not telescope or not builtin then
    return
end

vim.keymap.set('n', ',f', function() builtin.find_files { prompt_title = '', previewer = false } end, {})
vim.keymap.set('n', ',r', function() builtin.live_grep { prompt_title = '', previewer = false } end, {})
vim.keymap.set('n', ',h', function() builtin.oldfiles { prompt_title = '', previewer = false } end, {})
vim.keymap.set('n', ',g', function() builtin.git_files { prompt_title = '', previewer = false } end, {})

telescope.setup {
    defaults = {
        results_title = '',
        prompt_prefix = '  ',
        selection_caret = '  ',
        sorting_strategy = 'ascending',
        layout_config = { width = 0.5, height = 0.6, preview_cutoff = 100, prompt_position = 'top' },
        get_status_text = function(self)
            local xx = (self.stats.processed or 0) - (self.stats.filtered or 0)
            local yy = self.stats.processed or 0

            if xx == 0 and yy == 0 then
                return ''
            end

            local ww = #(self:get_multi_selection())
            return ww == 0 and string.format("%s / %s  ", xx, yy) or string.format("%s / %s / %s  ", ww, xx, yy)
        end
    }
}

vim.api.nvim_set_hl(0, 'TelescopeBorder', { link = 'WindowSeparator' })
vim.api.nvim_set_hl(0, 'TelescopeNormal', { link = 'Normal' })
