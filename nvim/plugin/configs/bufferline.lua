local bufferline = import 'bufferline'
local bufremove = import 'mini.bufremove'

if vim.g.vscode or not bufferline or not bufremove then
    return
end

vim.keymap.set({ 'n', 'i' }, '<C-Tab>', function() bufferline.cycle(1) end, {})
vim.keymap.set({ 'n', 'i' }, '<C-S-Tab>', function() bufferline.cycle(-1) end, {})
vim.keymap.set('n', '<leader>gb', function() bufferline.move(1) end, {})
vim.keymap.set('n', '<leader>bg', function() bufferline.move(-1) end, {})
vim.keymap.set('n', '<C-t>w', ':bd<CR>', {})
vim.keymap.set('i', '<C-t>w', '<C-o>:bd<CR>', { silent = true })

for i = 1, 9 do
    vim.keymap.set({'n', 'i'}, '<C-t>' .. i, function() bufferline.go_to_buffer(i) end, {})
end

vim.api.nvim_set_hl(0, 'BufferLineIndicatorVisible', { link = 'Normal' })

bufferline.setup {
    options = {
        indicator = { style = ' '},
        show_close_icon = false,
        diagnostics = 'nvim_lsp',
        separator_style = { '', '' },
        show_buffer_close_icons = false,
        offsets = { { filetype = 'NvimTree' } },
        diagnostics_indicator = function(_, _, _, _) return '  ' end,
        right_mouse_command = function(bufnr) bufremove.delete(bufnr) end,
    },
    highlights = {
        fill = {
            bg = { attribute = 'bg', highlight = 'Normal' }
        },
        background = {
            bg = { attribute = 'bg', highlight = 'Normal' }
        },
        buffer_visible = {
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        buffer = {
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        buffer_selected = {
            fg = { attribute = 'fg', highlight = 'CursorLineNr' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        modified = {
            fg = { attribute = 'fg', highlight = 'NonText' },
            bg = { attribute = 'bg', highlight = 'NonText' },
        },
        modified_visible = {
            fg = { attribute = 'fg', highlight = 'NonText' },
            bg = { attribute = 'bg', highlight = 'NonText' },
        },
        modified_selected = {
            fg = { attribute = 'fg', highlight = 'Normal' },
        },
        duplicate = {
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        duplicate_visible = {
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        duplicate_selected = {
            fg = { attribute = 'fg', highlight = 'CursorLineNr' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        diagnostic = {
            fg = { attribute = 'fg', highlight = 'LspDiagnostics' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        diagnostic_visible = {
            fg = { attribute = 'fg', highlight = 'LspDiagnostics' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        diagnostic_selected = {
            fg = { attribute = 'fg', highlight = 'LspDiagnostics' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        error = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsError' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        error_visible = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsError' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        error_selected = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsError' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        error_diagnostic = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsError' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        error_diagnostic_visible = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsError' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        error_diagnostic_selected = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsError' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        warning = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsWarning' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        warning_visible = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsWarning' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        warning_selected = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsWarning' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        warning_diagnostic = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsWarning' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        warning_diagnostic_visible = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsWarning' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        warning_diagnostic_selected = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsWarning' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        info = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsInformation' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        info_visible = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsInformation' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        info_selected = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsInformation' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        info_diagnostic = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsInformation' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        info_diagnostic_visible = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsInformation' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        info_diagnostic_selected = {
            fg = { attribute = 'fg', highlight = 'LspDiagnosticsInformation' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        hint = {
            fg = { attribute = 'fg', highlight = 'LspDiagnostics' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        hint_visible = {
            fg = { attribute = 'fg', highlight = 'LspDiagnostics' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        hint_selected = {
            fg = { attribute = 'fg', highlight = 'LspDiagnostics' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        hint_diagnostic = {
            fg = { attribute = 'fg', highlight = 'LspDiagnostics' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        hint_diagnostic_visible = {
            fg = { attribute = 'fg', highlight = 'LspDiagnostics' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
        hint_diagnostic_selected = {
            fg = { attribute = 'fg', highlight = 'LspDiagnostics' },
            bg = { attribute = 'bg', highlight = 'Normal' },
        },
    }
}
