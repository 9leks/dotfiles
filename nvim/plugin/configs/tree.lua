local tree = import 'nvim-tree'

if vim.g.vscode or not tree then
    return
end

tree.setup {
    update_cwd = true,
    disable_netrw = true,
    hijack_cursor = true,
    filters = {
        dotfiles = true,
        custom = { 'build', '*.bst', '*.ins', '*.cls' },
    },
    system_open = {
        args = { '-R' },
    },
    live_filter = {
        prefix = '',
    },
    view = {
        adaptive_size = true,
        hide_root_folder = true,
    },
    renderer = {
        root_folder_modifier = ':t',
        indent_markers = {
            enable = true,
        },
        icons = {
            padding = '  ',
            git_placement = 'signcolumn',
            glyphs = {
                default = '',
                git = {
                    unstaged = '+',
                    staged = '+',
                    renamed = 'Ｒ',
                    untracked = '？',
                    deleted = '－',
                    ignored = '！',
                },
                folder = {
                    default = ' ',
                    open = ' ',
                    arrow_open = ' ',
                    arrow_closed = ' ',
                    empty_open = ' ',
                    empty = ' ',
                    symlink = ' ',
                    symlink_open = ' ',
                },
            }
        }
    }
}

highlight('NvimTreeNormal', { link = 'Normal' })
highlight('NvimTreeRootFolder', { link = 'NonText' })
highlight('NvimTreeIndentMarker', { link = 'LineNr' })
highlight('NvimTreeWindowSeparator', { link = 'WindowSeparator' })
highlight('NvimTreeGitNew', { link = 'GitSignsChange' })
highlight('NvimTreeGitDirty', { link = 'GitSignsAdd' })
highlight('NvimTreeGitStaged', { link = 'GitSignsChange' })
highlight('NvimTreeGitDeleted', { link = 'GitSignsDelete' })

keymap('n', '<M-r>', tree.toggle)
keymap('n', '<M-e>', function() tree.toggle(true) end)

autocmd('BufEnter', {
    pattern = 'NvimTree_*',
    callback = function()
        vim.cmd.stopinsert()
        highlight('NvimTreeCursorLine', { link = 'CursorLine' })
    end
})

autocmd('BufLeave', {
    pattern = 'NvimTree_*',
    callback = function()
        highlight('NvimTreeCursorLine', { bg = 'None' })
    end
})
