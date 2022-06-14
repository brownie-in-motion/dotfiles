return require 'packer'.startup(function()
    -- apparently I need this
    use 'wbthomason/packer.nvim'

    -- writing cod is too hard
    use 'github/copilot.vim'
    use {
        'williamboman/nvim-lsp-installer',
        'neovim/nvim-lspconfig',
        {
            'ms-jpq/coq_nvim',
            run = 'python3 -m coq deps',
        },
        'ms-jpq/coq.artifacts',
        'ms-jpq/coq.thirdparty',
    }

    -- tpope strong
    use 'tpope/vim-surround'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'

    -- colors
    use { 'joshdick/onedark.vim', config = function()
        -- make background match terminal
        vim.api.nvim_create_augroup('colorset', { clear = true })
        vim.api.nvim_create_autocmd('ColorScheme', {
            group = 'colorset',
            pattern = '*',
            command = '\z
                call onedark#set_highlight("Normal", { \z
                    "fg": { \z
                        "gui": "#ABB2BF", \z
                        "cterm": "NONE", \z
                        "cterm16": "NONE" \z
                    } \z
                }) \z
            ',
        })

        -- have status line be less blue
        vim.api.nvim_create_autocmd('ColorScheme', {
            group = 'colorset',
            pattern = '*',
            command = '\z
                call onedark#set_highlight("StatusLine", { \z
                    "bg": { \z
                        "gui": "#262626", \z
                        "cterm": "NONE", \z
                        "cterm16": "NONE" \z
                    } \z
                }) \z
            ',
        })

        -- actually use the color scheme
        vim.cmd 'colorscheme onedark'
    end }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)
