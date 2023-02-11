return require 'packer'.startup(function()
    -- apparently I need this
    use 'wbthomason/packer.nvim'

    -- writing cod is too hard
    use { 'github/copilot.vim', disable = false }
    use {
        { 'williamboman/nvim-lsp-installer', disable = false },
        { 'neovim/nvim-lspconfig', disable = false },
        {
            'ms-jpq/coq_nvim',
            disable = false,
            run = 'python3 -m coq deps',
        },
        { 'ms-jpq/coq.artifacts', disable = false },
        { 'ms-jpq/coq.thirdparty', disable = false },
    }
    use {
        { 'nvim-lua/plenary.nvim', disable = false },
        { 'jose-elias-alvarez/null-ls.nvim', disable = false },
    }
    use { 'lervag/vimtex', disable = false, config = function()
        vim.g.vimtex_view_method = 'zathura'
        vim.g.vimtex_quickfix_ignore_filters = {
            'Writing or overwriting file',
        }
        vim.g.vimtex_compiler_latexmk = {
            executable = 'latexmk',
            options = {
                '-verbose',
                '-file-line-error',
                '-synctex=1',
                '-interaction=nonstopmode',
                '-shell-escape',
            }
        }
    end }

    -- files
    use { 'kyazdani42/nvim-tree.lua', disable = false }

    -- tpope strong
    use { 'tpope/vim-surround', disable = false, config = function()
        vim.g.surround_36 = '\\( \r \\)'
        vim.g.surround_32 = ' \r '
    end }
    use { 'tpope/vim-fugitive', disable = false }
    use { 'tpope/vim-repeat', disable = false }

    -- colors
    use { 'joshdick/onedark.vim', disable = false, config = function()
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

    use {
        'nvim-treesitter/nvim-treesitter',
        disable = false,
        run = ':TSUpdate'
    }
    use { 'rvmelkonian/move.vim', disable = false }

    use { 'iamcco/markdown-preview.nvim', disable = false }

    -- need this for class
    use {
        'brownie-in-motion/jupyter-ascending.vim',
        disable = false,
        config = function()
            local o = { silent = true }
            vim.api.nvim_set_keymap(
                'n',
                '<space>x',
                '<Plug>JupyterExecute',
                o
            )
            vim.api.nvim_set_keymap(
                'n',
                '<space>X',
                '<Plug>JupyterExecuteAll',
                o
            )
        end
    }
end)
