require('nvim-tree').setup({
    sort_by = 'case_sensitive',
    view = { adaptive_size = true, },
    filters = { dotfiles = true, },
    renderer = {
        icons = {
            show = {
                file = false,
                folder = false,
                folder_arrow = false,
                git = false,
            },
            glyphs = {
                symlink = '',
            },
        },
        symlink_destination = false,
    },
})

local o = { noremap = true, silent = true, buffer = buf }
vim.keymap.set('n', '<space>t', ':NvimTreeToggle<CR>', o)
