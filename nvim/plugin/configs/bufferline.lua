local bufferline = import 'bufferline'
local bufremove = import 'mini.bufremove'

if vim.g.vscode or not bufferline or not bufremove then
    return
end

bufferline.setup {
    options = {
        indicator_icon = ' ',
        show_close_icon = false,
        diagnostics = 'nvim_lsp',
        separator_style = { '', '' },
        show_buffer_close_icons = false,
        diagnostics_indicator = function(_, _, _, _) return '  ' end,
        right_mouse_command = function(bufnr) bufremove.delete(bufnr) end,
        offsets = {
            {
                text_align = 'left',
                highlight = 'NonText',
                filetype = 'NvimTree',
                text = function() return vim.b.branch end,
            }
        },
    },
    highlights = {
        fill = {
            guibg = { attribute = 'bg', highlight = 'Normal' }
        },
        background = {
            guibg = { attribute = 'bg', highlight = 'Normal' }
        },
        buffer = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        buffer_visible = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        buffer_selected = {
            guifg = { attribute = 'fg', highlight = 'Normal' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
            gui = false,
        },
        modified = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'NonText' },
        },
        modified_visible = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'NonText' },
        },
        modified_selected = {
            guifg = { attribute = 'fg', highlight = 'Normal' },
            gui = false,
        },
        duplicate = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'NonText' },
            gui = 'bold',
        },
        duplicate_visible = {
            guibg = { attribute = 'bg', highlight = 'Normal' },
            gui = 'bold',
        },
        duplicate_selected = {
            guifg = { attribute = 'fg', highlight = 'Normal' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
            gui = 'bold',
        },
        diagnostic = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        diagnostic_visible = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        diagnostic_selected = {
            guifg = { attribute = 'fg', highlight = 'Normal' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
            gui = false,
        },
        error = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        error_visible = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        error_selected = {
            guifg = { attribute = 'fg', highlight = 'Normal' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
            gui = false,
        },
        error_diagnostic = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        error_diagnostic_visible = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        error_diagnostic_selected = {
            guifg = { attribute = 'fg', highlight = 'Normal' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
            gui = false,
        },
        warning = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        warning_visible = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        warning_selected = {
            guifg = { attribute = 'fg', highlight = 'Normal' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
            gui = false,
        },
        warning_diagnostic = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        warning_diagnostic_visible = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        warning_diagnostic_selected = {
            guifg = { attribute = 'fg', highlight = 'Normal' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
            gui = false,
        },
        info = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        info_visible = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        info_selected = {
            guifg = { attribute = 'fg', highlight = 'Normal' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
            gui = false,
        },
        info_diagnostic = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        info_diagnostic_visible = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        info_diagnostic_selected = {
            guifg = { attribute = 'fg', highlight = 'Normal' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
            gui = false,
        },
        hint = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        hint_visible = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        hint_selected = {
            guifg = { attribute = 'fg', highlight = 'Normal' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
            gui = false
        },
        hint_diagnostic = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        hint_diagnostic_visible = {
            guifg = { attribute = 'fg', highlight = 'NonText' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
        },
        hint_diagnostic_selected = {
            guifg = { attribute = 'fg', highlight = 'Normal' },
            guibg = { attribute = 'bg', highlight = 'Normal' },
            gui = false,
        },
    }
}

highlight('BufferLineSeparator', { link = 'WindowSeparator' })
highlight('BufferLineSeparatorVisible', { link = 'WindowSeparator' })
highlight('BufferLineSeparatorSelected', { link = 'WindowSeparator' })
highlight('BufferLineIndicatorVisible', { link = 'Normal' })

keymap({ 'n', 'i' }, '<C-Tab>', function() bufferline.cycle(1) end)
keymap({ 'n', 'i' }, '<C-S-Tab>', function() bufferline.cycle(-1) end)
keymap('n', '<leader>gb', function() bufferline.move(1) end)
keymap('n', '<leader>bg', function() bufferline.move(-1) end)

for i = 1, 9 do
    keymap({ 'n', 'i' }, '<C-t>' .. i, function() bufferline.go_to_buffer(i) end)
end
