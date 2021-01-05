local builtin = require('telescope.builtin')

vimp.nnoremap('<Leader>ff', function() builtin.find_files() end)
vimp.nnoremap('<Leader>fg', function() builtin.live_grep() end)
vimp.nnoremap('<Leader>fb', function() builtin.buffers() end)
vimp.nnoremap('<Leader>fh', function() builtin.help_tags() end)
