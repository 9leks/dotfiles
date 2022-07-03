vim.g.registers_insert_mode = false
vim.cmd [[ imap <buffer> <expr> <C-R> &ft=='TelescopePrompt' ? '<C-R>' : registers#peek('<C-R>') ]]
