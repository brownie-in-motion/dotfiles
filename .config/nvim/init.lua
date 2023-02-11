require 'plugins'
require 'options'

require 'config.lsp'
require 'config.status'
require 'config.tree'
require 'config.treesitter'

vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
    pattern = {'*.ikea'},
    callback = function() vim.api.nvim_command('set filetype=yaml') end,
})

vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
    pattern = {'*.sage'},
    callback = function() vim.api.nvim_command('set filetype=python') end,
})
