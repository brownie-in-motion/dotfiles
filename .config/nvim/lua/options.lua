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
    ignorecase = true,

    -- less delay
    updatetime = 100,

    -- colors
    termguicolors = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
