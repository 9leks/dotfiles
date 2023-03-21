local cmp = import 'cmp'
local luasnip = import 'luasnip'

if vim.g.vscode or not cmp or not luasnip then
    return
end

-- disable vim's ins-completion
vim.keymap.set('i', '<C-p>', '<nop>', {})
vim.keymap.set('i', '<C-n>', '<nop>', {})

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

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
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

    completion = {
        completeopt = 'menu,menuone,noinsert',
        keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
        keyword_length = 1,
    },

    mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping.confirm { select = true },
        ['<Leader>]'] = cmp.mapping(function(fallback)
            if vim.fn['vsnip#available']() == 1 then
                vim.fn.feedkeys(t('<Plug>(vsnip-expand-or-jump)'), '')
            else
                fallback()
            end
        end,
            { 'i', 's', }
        ),
        ['<Leader>['] = cmp.mapping(function(fallback)
            if vim.fn['vsnip#jumpable'](-1) == 1 then
                vim.fn.feedkeys(t('<Plug>(vsnip-jump-prev)'), '')
            else
                fallback()
            end
        end,
            { 'i', 's', }
        ),
    },

    formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(_, vim_item)
            vim_item.kind = icons[vim_item.kind]
            return vim_item
        end,
    },

    sources = cmp.config.sources {
        { name = 'vsnip' },
        { name = 'buffer' },
        { name = 'nvim_lsp' },
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
    }
})
