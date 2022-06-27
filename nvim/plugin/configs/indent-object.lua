local opts = { remap = true }

keymap('x', 'ii', '<Plug>(indent-object_linewise-none)', opts)
keymap('o', 'ii', '<Plug>(indent-object_blockwise-none)', opts)

keymap('x', 'ai', '<Plug>(indent-object_linewise-start)', opts)
keymap('o', 'ai', '<Plug>(indent-object_linewise-start)', opts)
keymap('x', 'iI', '<Plug>(indent-object_linewise-end)', opts)
keymap('o', 'iI', '<Plug>(indent-object_linewise-end)', opts)
keymap('x', 'aI', '<Plug>(indent-object_linewise-both)', opts)
keymap('o', 'aI', '<Plug>(indent-object_linewise-both)', opts)

keymap('o', 'ij', '<Plug>(indent-object_linewise-none-keep-start)', opts)
keymap('x', 'ij', '<Plug>(indent-object_linewise-none-keep-start)', opts)
keymap('o', 'ik', '<Plug>(indent-object_linewise-none-keep-end)', opts)
keymap('x', 'ik', '<Plug>(indent-object_linewise-none-keep-end)', opts)

keymap('o', 'iJ', '<Plug>(indent-object_linewise-end-keep-start)', opts)
keymap('x', 'iJ', '<Plug>(indent-object_linewise-end-keep-start)', opts)
keymap('o', 'iK', '<Plug>(indent-object_linewise-start-keep-end)', opts)
keymap('x', 'iK', '<Plug>(indent-object_linewise-start-keep-end)', opts)

keymap('o', 'ibj', '<Plug>(indent-object_blockwise-none-keep-start)', opts)
keymap('x', 'ibj', '<Plug>(indent-object_blockwise-none-keep-start)', opts)
keymap('o', 'ibJ', '<Plug>(indent-object_blockwise-end-keep-start)', opts)
keymap('x', 'ibJ', '<Plug>(indent-object_blockwise-end-keep-start)', opts)

keymap('o', 'ibk', '<Plug>(indent-object_blockwise-none-keep-end)', opts)
keymap('x', 'ibk', '<Plug>(indent-object_blockwise-none-keep-end)', opts)
keymap('o', 'ibK', '<Plug>(indent-object_blockwise-start-keep-end)', opts)
keymap('x', 'ibK', '<Plug>(indent-object_blockwise-start-keep-end)', opts)
