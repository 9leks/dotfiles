local cmp = import 'cmp'
local snippets = import 'luasnip'

if vim.g.vscode or not cmp or not snippets then
    return
end

-- disable vim's ins-completion
keymap('i', '<C-p>', '<nop>')
keymap('i', '<C-n>', '<nop>')

local icons = {
    Text = '',
    Method = '',
    Function = '',
    Constructor = '',
    Field = 'ﰠ',
    Variable = '',
    Class = 'ﴯ',
    Interface = '',
    Module = '',
    Property = 'ﰠ',
    Unit = '塞',
    Value = '',
    Enum = '',
    Keyword = '廓',
    Snippet = '',
    Color = '',
    File = '',
    Reference = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = 'פּ',
    Event = '',
    Operator = '',
    TypeParameter = '',
}

cmp.setup {
    snippet = {
        expand = function(args) snippets.lsp_expand(args.body) end,
    },
    completion = {
        completeopt = 'menu,menuone,noinsert',
    },
    window = {
        completion = {
            border = 'rounded',
            scrollbar = '║',
            winhighlight = 'NormalFloat:Normal,FloatBorder:WindowSeparator',
        },
        documentation = {
            border = 'rounded',
            scrollbar = '║',
            winhighlight = 'NormalFloat:Normal,FloatBorder:WindowSeparator',
        },
    },
    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(_, vim_item)
            vim_item.kind = icons[vim_item.kind]
            return vim_item
        end,
    },
    sources = cmp.config.sources {
        { name = 'omni' },
        { name = 'buffer' },
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.mapping.confirm({ select = true })()
            elseif snippets.expand_or_jumpable() then
                snippets.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }
        ),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if snippets.jumpable(-1) then
                snippets.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }
        ),
    },
}

cmp.setup.filetype('gitcommit', {
    completion = { completeopt = 'menu,menuone,noselect' },
    sources = cmp.config.sources {
        { name = 'cmp_git' },
        { name = 'buffer' },
    }
})

cmp.setup.cmdline('/', {
    completion = { completeopt = 'menu,menuone,noselect' },
    mapping = cmp.mapping.preset.cmdline(),
    sources = { { name = 'buffer' } }
})

cmp.setup.cmdline(':', {
    completion = { completeopt = 'menu,menuone,noselect' },
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources {
        { name = 'path' },
        { name = 'cmdline' },
        { name = 'buffer' },
    }
})
