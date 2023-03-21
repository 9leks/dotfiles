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
    },
    renderer = {
        root_folder_modifier = ':t',
        indent_markers = {
            enable = true,
        },
        icons = {
            padding = ' ',
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
                    default = ' ',
                    open = ' ',
                },
            }
        }
    }
}

vim.keymap.set('n', '<C-t>E', function() tree.toggle(true) end, {})

vim.api.nvim_set_hl(0, 'NvimTreeNormal', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { link = 'FloatBorder' })

vim.api.nvim_set_hl(0, 'NvimTreeGitNew', { link = 'GitSignsChange' })
vim.api.nvim_set_hl(0, 'NvimTreeGitDirty', { link = 'GitSignsAdd' })
vim.api.nvim_set_hl(0, 'NvimTreeGitStaged', { link = 'GitSignsChange' })
vim.api.nvim_set_hl(0, 'NvimTreeGitDeleted', { link = 'GitSignsDelete' })

vim.api.nvim_create_autocmd('BufEnter', {
    pattern = 'NvimTree_*',
    callback = function()
        vim.cmd 'stopinsert'
        vim.api.nvim_set_hl(0, 'NvimTreeCursorLine', { link = 'CursorLine' })
    end
})

vim.api.nvim_create_autocmd('BufLeave', {
    pattern = 'NvimTree_*',
    callback = function()
        vim.api.nvim_set_hl(0, 'NvimTreeCursorLine', { bg = 'None' })
    end
})
