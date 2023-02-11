local options = {
    -- history
    undofile = true,

    -- indentation stuff
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    autoindent = true,

    -- scrolling
    scrolloff = 5,
    sidescroll = 1,

    -- line numbers
    number = true,
    relativenumber = true,

    -- spaces
    list = true,

    -- nicer searching
    incsearch = true,

    -- less delay
    updatetime = 100,

    -- appearance
    termguicolors = true,
    showmode = false,
    colorcolumn = '80',

    -- nope
    mouse = '',
}

function set_options(options)
    for k, v in pairs(options) do
        vim.opt[k] = v
    end
end

vim.g.mapleader = ' '

set_options(options)
